//
//  MainRouter.swift
//  IslandBridgeConstructor
//
//  Created by Chavalit Vanasapdamrong on 3/20/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import UIKit

class MainRouter: MainWireframe {

    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = UIStoryboard(name: "MainStoryboard", bundle: nil).instantiateViewController(withIdentifier: "MainViewController") as? MainViewController
        let presenter = MainPresenter()
        let interactor = MainInteractor()
        let router = MainRouter()
        
        let navigation = UINavigationController(rootViewController: view!)
        
        view?.presenter = presenter
        
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        interactor.output = presenter
        
        router.viewController = view
        
        return navigation
    }
    
}
