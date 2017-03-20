//
//  Route.swift
//  IslandBridgeConstructor
//
//  Created by Chavalit Vanasapdamrong on 3/20/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import Foundation

class Route {
    
    private(set) var bridges = [Bridge]() {
        didSet {
            bridges.forEach { bridge in
                bitwise = bitwise | bridge.bitwise
            }
        }
    }
    
    private(set) var bitwise: Int64 = 0
    
    func addBridge(_ bridge: Bridge) -> Int64 {
        bridges.append(bridge)
        return bitwise
    }
    
    func going(from:Island, to:Island) -> Bool {
        let pathBit = from.bitwise | to.bitwise
        return bitwise.contains(pathBit)
    }
    
}
