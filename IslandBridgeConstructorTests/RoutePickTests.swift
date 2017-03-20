//
//  RoutePickTests.swift
//  IslandBridgeConstructor
//
//  Created by Chavalit Vanasapdamrong on 3/20/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import XCTest
@testable import IslandBridgeConstructor

class RoutePickTests: XCTestCase {
    
    func testPickRouteWhichOldestBridgeIsNewest() {
        let island1 = Island(id: 1)
        let island2 = Island(id: 2)
        let island3 = Island(id: 3)
        
        let bridge1 = Bridge(from: island1, to: island3, date: 1)
        let bridge2 = Bridge(from: island1, to: island2, date: 2)
        let bridge3 = Bridge(from: island2, to: island3, date: 3)
        
        island1.addBridge(bridge1)
        island1.addBridge(bridge2)
        
        island2.addBridge(bridge2)
        island2.addBridge(bridge3)
        
        island3.addBridge(bridge1)
        island3.addBridge(bridge3)
        
        let routes = island1.bridges.getRoutes(from: island1, to: island3)
        let route = routes.routeWhichOldestBridgeIsNewest
        XCTAssertNotNil(route)
        
        if let result = route {
            if let oldestBridge = result.bridges.oldestBridge {
                XCTAssert(oldestBridge === bridge2)
            }
        }
    }
    
}
