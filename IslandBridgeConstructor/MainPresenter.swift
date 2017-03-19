//
//  MainPresenter.swift
//  IslandBridgeConstructor
//
//  Created by Chavalit Vanasapdamrong on 3/20/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import UIKit

class MainPresenter: MainPresentation {
    
    weak var view: MainView?
    var interactor: MainUseCase!
    var router: MainWireframe!
    
    func viewDidLoad() {
        
    }
    
}

extension MainPresenter: MainInteractorOutput {
    
}
