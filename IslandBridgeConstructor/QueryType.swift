//
//  ConstructionType.swift
//  IslandBridgeConstructor
//
//  Created by Chavalit Vanasapdamrong on 3/19/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import Foundation

enum QueryType {
    
    case Build(Int, Int)
    case Check(Int, Int)
    
    var queryDetail: String {
        switch self {
        case .Build(let id1, let id2):
            return "build \(id1) \(id2)"
        case .Check(let id1, let id2):
            return "check \(id1) \(id2)"
        }
    }
    
}
