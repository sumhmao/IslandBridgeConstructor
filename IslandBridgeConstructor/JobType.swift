//
//  ConstructionType.swift
//  IslandBridgeConstructor
//
//  Created by Chavalit Vanasapdamrong on 3/19/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import Foundation

enum JobType {
    
    case ConstructBridge(Int, Int)
    case InspectBridge(Int, Int)
    
    var jobDetail: String {
        switch self {
        case .ConstructBridge(let id1, let id2):
            return "Constructed a bridge between Island\(id1) and Island\(id2)"
        case .InspectBridge(let id1, let id2):
            return "Inspected a bridge between Island\(id1) and Island\(id2)"
        }
    }
    
}
