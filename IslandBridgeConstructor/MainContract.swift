//
//  MainContract.swift
//  IslandBridgeConstructor
//
//  Created by Chavalit Vanasapdamrong on 3/20/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import UIKit

protocol MainView: class {
    var presenter: MainPresentation! { get set }
}

protocol MainPresentation: class {
    weak var view: MainView? { get set }
    var interactor: MainUseCase! { get set }
    var router: MainWireframe! { get set }
    
    func viewDidLoad()
}

protocol MainUseCase: class {
    weak var output: MainInteractorOutput! { get set }
}

protocol MainInteractorOutput: class {
    
}

protocol MainWireframe: class {
    weak var viewController: UIViewController? { get set }
    
    static func assembleModule() -> UIViewController
}

