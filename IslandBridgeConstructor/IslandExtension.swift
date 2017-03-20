//
//  IslandExtension.swift
//  IslandBridgeConstructor
//
//  Created by Chavalit Vanasapdamrong on 3/20/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import Foundation

extension Island {
    
    func canBuildBridge(to: Island) -> Bool {
        for bridge in bridges {
            if bridge.reach(to) {
                return false
            }
        }
        return true
    }
    
}
