//
//  ServiceApiManager.swift
//  quizJusto
//
//  Created by Charls Salazar on 26/01/22.
//

import Foundation

class ServiceApiManager{
    let jsonDecoder = JSONDecoder()
   
    func sendRequest<Res:Codable>(mURL: String, mTypeReqeust : TypeRequest, mResponseClass: Res.Type, _ mResponse:@escaping (Res) -> Void){
        var request = URLRequest(url: URL(string: mURL)!)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.httpMethod = mTypeReqeust.rawValue
        request.timeoutInterval = 30.0
                
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                guard error == nil else {
                    print("error contact server")
                    return
                }
                 
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                    print("error code http")
                    return
                }
                
                if let mimeType = httpResponse.mimeType, mimeType == "application/json",
                   let data = data{
                    do {
                        let jsonString = String(data: data, encoding: .utf8) ?? ""
                        print("Response Json", jsonString)
                        let decoder = JSONDecoder()
                        let responseOBJ = try decoder.decode(mResponseClass, from: data)
                        mResponse(responseOBJ)
                    } catch let error{
                        print("error parsing data -> ", error)
                    }
                }
            }
        }.resume()
    }
}

enum TypeRequest: String{
    case get = "GET"
}


