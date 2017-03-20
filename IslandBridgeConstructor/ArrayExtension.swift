//
//  ArrayExtension.swift
//  IslandBridgeConstructor
//
//  Created by Chavalit Vanasapdamrong on 3/19/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import Foundation

extension Array where Element: AnyObject {
    
    mutating func removeObject(_ object:Element) {
        if let index = self.index(where: { $0 === object }) {
            self.remove(at: index)
        }
    }
    
    mutating func removeObjects(_ objects:[Element]) {
        objects.forEach { object in
            self.removeObject(object)
        }
    }
    
    func randomItem() -> Element {
        let index = Int(arc4random_uniform(UInt32(self.count)))
        return self[index]
    }
    
    func randomItemWithException(_ exception:[Element]) -> Element {
        var targetGroup = [Element](self)
        targetGroup.removeObjects(exception)
        return targetGroup.randomItem()
    }
    
}

extension Array where Element: Bridge {
    
    mutating func sortBridgeAge() {
        self.sort{ bridge1, bridge2 in
            bridge1.constructedDate > bridge2.constructedDate
        }
    }
    
    func sortedBridgeAge() -> [Element] {
        return self.sorted{ bridge1, bridge2 in
            bridge1.constructedDate > bridge2.constructedDate
        }
    }
    
    var oldestBridge: Element? {
        get {
            guard self.count > 0 else {
                return nil
            }
            let collection = self.sortedBridgeAge()
            return collection.last
        }
    }
    
    func getRoutes(from:Island, to:Island) -> [Route] {
        var routes = [Route]()
        from.bridges.forEach{ bridge in
            let allRoutes = bridge.allRoutes(from: from, to: to)
            allRoutes?.forEach{ route in
                if route.going(from: from, to: to) {
                    routes.append(route)
                }
            }
        }
        return routes
    }
    
}

extension Array where Element: Route {
    
    var routeWhichOldestBridgeIsNewest:Route? {
        get {
            guard self.count > 0 else {
                return nil
            }
            
            var selectedRoute:Route? = nil
            self.forEach { route in
                let oldestBridge = route.bridges.oldestBridge
                if let oldest = oldestBridge, let currentRoute = selectedRoute {
                    if currentRoute.bridges.oldestBridge!.constructedDate < oldest.constructedDate {
                        selectedRoute = route
                    }
                } else if let _ = oldestBridge {
                    selectedRoute = route
                }
            }
            return selectedRoute
        }
    }
    
}
