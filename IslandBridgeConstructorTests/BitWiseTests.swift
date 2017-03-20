//
//  BitWiseTests.swift
//  IslandBridgeConstructor
//
//  Created by Chavalit Vanasapdamrong on 3/20/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import XCTest
@testable import IslandBridgeConstructor

class BitWiseTests: XCTestCase {
    
    func testCreateBridgeWise() {
        let island1 = Island(id: 1)
        let island2 = Island(id: 2)
        let island3 = Island(id: 3)
        
        let bridge1 = Bridge(from: island1, to: island2, date: 1)
        let bridge2 = Bridge(from: island1, to: island3, date: 1)
        let bridge3 = Bridge(from: island2, to: island3, date: 1)
        
        XCTAssertEqual(bridge1.bitwise, island1.bitwise | island2.bitwise)
        XCTAssertEqual(bridge2.bitwise, island1.bitwise | island3.bitwise)
        XCTAssertEqual(bridge3.bitwise, island2.bitwise | island3.bitwise)
    }
    
    func testCreateRouteWise() {
        let island1 = Island(id: 1)
        let island2 = Island(id: 2)
        let island3 = Island(id: 3)
        
        let bridge1 = Bridge(from: island1, to: island2, date: 1)
        let bridge2 = Bridge(from: island1, to: island3, date: 1)
        let bridge3 = Bridge(from: island2, to: island3, date: 1)
        
        let route = Route()
        var bitwise: Int64 = 0
        
        bitwise = bitwise | route.addBridge(bridge1)
        bitwise = bitwise | route.addBridge(bridge2)
        bitwise = bitwise | route.addBridge(bridge3)
        
        XCTAssertEqual(bitwise, island1.bitwise | island2.bitwise | island3.bitwise)
        
        XCTAssertTrue(route.going(from: island1, to: island2))
        XCTAssertTrue(route.going(from: island1, to: island3))
        XCTAssertTrue(route.going(from: island2, to: island3))
    }
    
}
