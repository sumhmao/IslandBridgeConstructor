//
//  RootRouter.swift
//  IslandBridgeConstructor
//
//  Created by Chavalit Vanasapdamrong on 3/20/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import UIKit

class RootRouter: RootWireframe {
    
    func presentMainScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = MainRouter.assembleModule()
    }
    
}
