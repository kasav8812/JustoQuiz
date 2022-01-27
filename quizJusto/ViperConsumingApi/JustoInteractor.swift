//
//  JustoInteractor.swift
//  quizJusto
//
//  Created by Charls Salazar on 26/01/22.
//

import Foundation


class JustoInteractor: Justo_PresenterToInteractor{
    var presenter: Justo_InteractorToPresenter?
    
    func consumingJustoAPI(mUrl: String) {
        ServiceApiManager.init().sendRequest(mURL: mUrl, mTypeReqeust: .get, mResponseClass: JustoModelProfile.self){ [self] Result in
            if Result.results != nil{
                presenter?.retrieveProfile(mResponse: Result)
            }else{
                print("error consuming")
            }
        }
    }
    
}
