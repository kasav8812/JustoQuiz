//
//  JustoModelProfile.swift
//  quizJusto
//
//  Created by Charls Salazar on 26/01/22.
//

import UIKit

struct JustoModelProfile: Codable {
    let results : [Results]?
    let info : Info?
}

struct Results: Codable{
    let gender : String?
    let name : Name?
    let location : Location?
    let email : String?
    let login : Login?
    let dob : Dob?
    let registered : Registered?
    let phone : String?
    let cell : String?
    let id : ID?
    let picture : Picture?
    let nat : String?
}

struct Info : Codable{
    let seed : String?
    let results : Int?
    let page : Int?
    let version : String?
}

struct Name : Codable{
    let title : String?
    let first : String?
    let last : String?
}

struct Location : Codable{
    var street : Street?
    var city : String?
    var state : String?
    var country : String?
    var postcode : Int?
    
    var coordinates : Coordinates?
    var timezone : TimeZone?
    
    enum CodingKeys: String, CodingKey {
        case street
        case city
        case state
        case country
        case postcode
        case coordinates
        case timezone
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        let converter = CodableConvert(keyContainer: values)
        self.street = converter.wrap(Street.self, .street)
        self.city = converter.string(.city)
        self.state = converter.string(.postcode)
        self.country = converter.string(.country)
        self.postcode = converter.int(.postcode)
        self.coordinates = converter.wrap(Coordinates.self, .coordinates)
        self.timezone = converter.wrap(TimeZone.self, .timezone)
    }
    
}

struct Street : Codable{
    let number : Int?
    let name : String?
}

struct Coordinates: Codable{
    let latitude : String?
    let longitude : String?
}

struct TimeZone : Codable{
    let offset : String?
    let description : String?
}

struct Login : Codable{
    let uuid : String?
    let username : String?
    let password : String?
    let salt : String?
    let md5 : String?
    let sha1 : String?
    let sha256 : String?
}

struct Dob : Codable{
    let date : String?
    let age : Int?
}

struct Registered : Codable{
    let date : String?
    let age : Int?
}

struct ID : Codable{
    let name : String?
    let value : String?
}

struct Picture : Codable{
    let large : String?
    let medium : String?
    let thumbnail : String?
}
