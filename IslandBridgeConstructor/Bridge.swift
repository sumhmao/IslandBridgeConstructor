//
//  Bridge.swift
//  IslandBridgeConstructor
//
//  Created by Chavalit Vanasapdamrong on 3/19/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import Foundation

struct Bridge {
    
    private(set) var relation: [Int]
    private(set) var constructedDate: Int
    
    init(firstId:Int, secondId:Int, date:Int) {
        relation = [firstId, secondId]
        constructedDate = date
    }
    
}
