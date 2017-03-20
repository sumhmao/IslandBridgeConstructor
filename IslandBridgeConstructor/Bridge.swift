//
//  Bridge.swift
//  IslandBridgeConstructor
//
//  Created by Chavalit Vanasapdamrong on 3/19/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import Foundation

class Bridge {
    
    private(set) var relation: [Island]
    private(set) var constructedDate: Int
    private(set) var bitwise: Int64 = 0
    
    init(from:Island, to:Island, date:Int) {
        relation = [from, to]
        constructedDate = date
        
        relation.forEach { island in
            bitwise = bitwise | island.bitwise
        }
    }
    
    func destination(from: Island) -> Island? {
        guard relation.contains(where: {$0 === from}) else {
            return nil
        }
        return relation.first(where: {$0 !== from})
    }
    
}
