//
//  SplashScreenViewController.swift
//  quizJusto
//
//  Created by Charls Salazar on 26/01/22.
//

import UIKit

class SplashScreenViewController: UIViewController {
    var mCounter = 0
    var mTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delaySplash()
    }
    
    func delaySplash(){
        mTimer.invalidate()
        mTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(actionDelay), userInfo: nil, repeats: true)
    }
    
    @objc func actionDelay(){
        mCounter += 1
       
        if(mCounter == 20){
            mTimer.invalidate()
            loadMainView()
        }
    }
    
    func loadMainView(){
        JustoRouter.createModule(mViewController : self)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
}
