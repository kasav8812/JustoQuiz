//
//  JustoProtocols.swift
//  quizJusto
//
//  Created by Charls Salazar on 26/01/22.
//

import Foundation


protocol Justo_ViewToPresenter{
    func consumingJustoAPI(mUrl : String)
}

protocol Justo_InteractorToPresenter {
    func retrieveProfile(mResponse : JustoModelProfile)
}

protocol Justo_PresenterToInteractor {
    func consumingJustoAPI(mUrl : String)
}

protocol Justo_PresenterToView {
    func showInfoProfile(mResponse : JustoModelProfile)
}
