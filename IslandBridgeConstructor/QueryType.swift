//
//  ConstructionType.swift
//  IslandBridgeConstructor
//
//  Created by Chavalit Vanasapdamrong on 3/19/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import Foundation

enum QueryType {
    
    case Build
    case Check
    case Unknown
    
    static func fromString(_ string: String) -> QueryType {
        switch string {
        case "build":
            return .Build
        case "check":
            return .Check
        default:
            return .Unknown
        }
    }
    
    func queryDetail(id1: Int, id2: Int) -> String {
        switch self {
        case .Build:
            return "build \(id1) \(id2)"
        case .Check:
            return "check \(id1) \(id2)"
        default:
            return "Unknown"
        }
    }
    
}
