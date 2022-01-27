//
//  JustoPresenter.swift
//  quizJusto
//
//  Created by Charls Salazar on 26/01/22.
//

import Foundation

class JustoPresenter{
    var view : Justo_PresenterToView?
    var interactor : Justo_PresenterToInteractor?
}

extension JustoPresenter : Justo_InteractorToPresenter{
    func retrieveProfile(mResponse : JustoModelProfile) {
        view?.showInfoProfile(mResponse: mResponse)
    }
}

extension JustoPresenter : Justo_ViewToPresenter{
    func consumingJustoAPI(mUrl: String) {
        interactor?.consumingJustoAPI(mUrl: mUrl)
    }
}


