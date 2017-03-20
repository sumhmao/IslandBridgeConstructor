//
//  ConstructionInfo.swift
//  IslandBridgeConstructor
//
//  Created by Chavalit Vanasapdamrong on 3/19/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import Foundation

class Query {
    
    private(set) var queryType: QueryType
    private(set) var from: Island
    private(set) var to: Island
    private(set) var queryDate: Int
    
    var checkBitwise: Int64 {
        return (from.bitwise | to.bitwise)
    }
    
    var description: String {
        return queryType.queryDetail
    }
    
    init(from:Island, to:Island, type:QueryType, date:Int) {
        self.from = from
        self.to = to
        queryType = type
        queryDate = date
    }
    
}
