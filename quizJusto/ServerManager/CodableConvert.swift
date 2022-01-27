//
//  CodableConvert.swift
//  quizJusto
//
//  Created by Charls Salazar on 27/01/22.
//

import UIKit

class CodableConvert<K> where K: CodingKey {
    let values: KeyedDecodingContainer<K>
    
    init(keyContainer values: KeyedDecodingContainer<K>) {
        self.values = values
    }
    
    func float(_ key: K) -> Float? {
        let res = wrapAndCastIfFail(Float.self, key) { (string) in
            return Float(string)
        }
        return res
    }
    
    func double(_ key: K) -> Double? {
        let res = wrapAndCastIfFail(Double.self, key) { (string) in
            return Double(string)
        }
        return res
    }
    
    func int(_ key: K) -> Int? {
        let res = wrapAndCastIfFail(Int.self, key) { (string) in
            return Int(string)
        }
        return res
    }
    
    func bool(_ key: K) -> Bool? {
        let res = wrapAndCastIfFail(Bool.self, key) { (string) in
            return Bool(string)
        }
        return res
    }
    
    func string(_ key: K) -> String? {
        let res = wrapAndCastIfFail(String.self, key) { (string) in
            return String(string)
        }
        return res
    }
    
    func wrap<T>(_ type: T.Type, _ key: K) -> T? where T : Decodable{
        let res = wrapAndCastIfFail(type, key, nil)
        return res
    }
    
    func wrapAndCastIfFail<T>(_ type: T.Type, _ key: K, _ closureCast: ((String) -> T?)?) -> T? where T: Decodable {
        //        Logger.d("wrap de \(type) con key: \(key)")
        var resultado: T?
        do {
            resultado = try values.decodeIfPresent(type, forKey: key)
        } catch {
            if let closureFail = closureCast {
                do {
                    if let value = try values.decodeIfPresent(String.self, forKey: key) {
                        resultado = closureFail(value)
                    }
                } catch {
                    print("No existe la \(key) como tipo String.")
                }
            } else {
                print("Error con la \(key) tipo \(type). Error: \(error)")
            }
        }
       
        return resultado
    }
}

