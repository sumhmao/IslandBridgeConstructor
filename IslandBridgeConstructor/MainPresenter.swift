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
    
    func didTapClear() {
        view?.hideKeyboard()
        view?.clearInput()
    }
    
    func didTapExecute(input: String) {
        view?.hideKeyboard()
        _ = interactor.executeLogic(input: input)
    }
    
}

extension MainPresenter: MainInteractorOutput {
    
    func gotResult(_ result: String) {
        view?.showOutput(result)
    }
    
    func failedToExecute(reason: String?) {
        if let message = reason {
            view?.showInvalidInputError(message: message)
        } else {
            view?.showInvalidInputError()
        }
    }
    
}
