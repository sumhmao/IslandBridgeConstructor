//
//  IntExtension.swift
//  IslandBridgeConstructor
//
//  Created by Chavalit Vanasapdamrong on 3/20/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import Foundation

extension Int {
    
    var bitwise:Int64 {
        return Int64(1) << Int64(self)
    }
    
}

extension Int64 {
    func contains(_ data: Int64) -> Bool {
        return (self & data) == data
    }
}
