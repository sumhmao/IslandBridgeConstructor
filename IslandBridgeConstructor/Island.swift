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
    private(set) var bridges = [AnyObject]()
    
    init(id:Int) {
        self.id = id
    }
}
