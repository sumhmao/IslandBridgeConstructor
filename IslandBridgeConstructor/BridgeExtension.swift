//
//  BridgeExtension.swift
//  IslandBridgeConstructor
//
//  Created by Chavalit Vanasapdamrong on 3/20/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import Foundation

extension Bridge {
    
    func older(than anotherBridge: Bridge) -> Bool {
        return self.constructedDate < anotherBridge.constructedDate
    }
    
    func reach(_ destination: Island) -> Bool {
        return relation.contains(where: {$0 === destination})
    }
    
    func removeFromIslands() {
        relation.forEach {island in
            island.removeBridge(self)
        }
    }
    
    func allRoutes(from: Island, to:Island) -> [Route]? {
        guard let destination = self.destination(from: from) else {
            return nil
        }
        
        var routes = [Route]()
        destination.bridges.forEach{ bridge in
            let route = Route()
            _ = route.addBridge(self)
            if let nestedBridges = bridge.allNestedBridge(from: from, to: to) {
                nestedBridges.forEach { subBridge in
                    _ = route.addBridge(subBridge)
                }
            }
            routes.append(route)
        }
        return routes
    }
    
    func allNestedBridge(from:Island, to:Island) -> [Bridge]? {
        guard let destination = self.destination(from: from) else {
            return nil
        }
        
        var bridges = [Bridge]()
        destination.bridges.forEach{ bridge in
            if bridge !== self {
                if let subDestination = bridge.destination(from: destination) {
                    if subDestination === to {
                        bridges.append(bridge)
                    } else {
                        if let nested = bridge.allNestedBridge(from: destination, to: to) {
                            bridges.append(contentsOf: nested)
                        }
                    }
                }
            }
        }
        return bridges
    }
    
}
