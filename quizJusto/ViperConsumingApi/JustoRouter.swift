//
//  JustoRouter.swift
//  quizJusto
//
//  Created by Charls Salazar on 26/01/22.
//

import Foundation
import UIKit

class JustoRouter {
    var view: UIViewController?

    static public func createModule(mViewController : UIViewController){
        let storyBoard: UIStoryboard = UIStoryboard(name: "JustonMain", bundle: nil)
        let view = storyBoard.instantiateViewController(withIdentifier: "JustoMainViewController") as! JustoMainViewController
        let interactor = JustoInteractor()
        let presenter = JustoPresenter()
        let router = JustoRouter()
        
        router.view = view
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        view.modalPresentationStyle = .fullScreen
        let mNC = UINavigationController(rootViewController: view)
        mNC.modalPresentationStyle = .overCurrentContext
        mViewController.present(mNC,animated: true,completion: nil)
    }
}
