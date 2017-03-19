//
//  Island.swift
//  IslandBridgeConstructor
//
//  Created by Chavalit Vanasapdamrong on 3/19/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import Foundation

class Island {
    
    private(set) var id: Int
    private(set) var bridges = [Bridge]()
        
    init(id:Int) {
        self.id = id
    }
    
    func addBridge(_ bridge:Bridge) {
        if !bridges.contains(where: {$0 === bridge}) {
            bridges.append(bridge)
        }
    }
}
