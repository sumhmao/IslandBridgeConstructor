//
//  Bridge.swift
//  IslandBridgeConstructor
//
//  Created by Chavalit Vanasapdamrong on 3/19/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import Foundation

class Bridge {
    
    private(set) var relation: [Island]
    private(set) var constructionInfo: JobInfo
    
    init(firstIsland:Island, secondIsland:Island, info:JobInfo) {
        relation = [firstIsland, secondIsland]
        constructionInfo = info
    }
    
    func destination(from: Island) -> Island? {
        guard relation.contains(where: {$0 === from}) else {
            return nil
        }
        return relation.first(where: {$0 !== from})
    }
    
}
