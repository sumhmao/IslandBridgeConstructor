//
//  BridgeTests.swift
//  IslandBridgeConstructor
//
//  Created by Chavalit Vanasapdamrong on 3/20/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import XCTest
@testable import IslandBridgeConstructor

class BridgeTests: XCTestCase {
    
    func testDestination() {
        let island1 = Island(id: 1)
        let island2 = Island(id: 2)
        
        let bridge1 = Bridge(from: island1, to: island2, date: 1)
        let destination = bridge1.destination(from: island1)
        
        XCTAssertNotNil(destination)
        
        if let destinate = destination {
            XCTAssert(destinate === island2)
        }
    }
    
    func testRoute() {
        let island1 = Island(id: 1)
        let island2 = Island(id: 2)
        
        let bridge1 = Bridge(from: island1, to: island2, date: 1)
        island1.addBridge(bridge1)
        island2.addBridge(bridge1)
        
        let routes = island1.bridges.getRoutes(from: island1, to: island2)
        
        XCTAssertEqual(routes.count, 1)
    }
    
}
