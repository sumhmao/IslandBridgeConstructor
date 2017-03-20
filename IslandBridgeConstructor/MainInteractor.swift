//
//  MainInteractor.swift
//  IslandBridgeConstructor
//
//  Created by Chavalit Vanasapdamrong on 3/20/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import UIKit

class MainInteractor: MainUseCase {
    
    weak var output: MainInteractorOutput!
    
    func executeLogic(input: String) -> Bool {
        let lines = input.lines
        
        guard lines.count > 1 else {
            output.failedToExecute(reason: nil)
            return false
        }
        
        let initialQuery = lines[0].trimSpace
        let initialItems = initialQuery.items
        
        guard initialItems.count == 2 else {
            output.failedToExecute(reason: nil)
            return false
        }
        
        let N = Int(initialItems[0])
        let Q = Int(initialItems[1])
        
        guard let nValue = N, let qValue = Q else {
            output.failedToExecute(reason: "Invalid query: \(initialQuery)")
            return false
        }
        
        guard qValue == lines.count - 1 else {
            output.failedToExecute(reason: "Total queries doesn't match Q: Expected:\(qValue), Actual:\(lines.count - 1)")
            return false
        }
        
        var queries = [Query]()
        for index in 1..<lines.count {
            
            let queryText = lines[index].trimSpace
            let items = queryText.items
            
            guard items.count == 3 else {
                output.failedToExecute(reason: "Invalid query: \(queryText)")
                return false
            }
            
            let queryType = QueryType.fromString(items[0])
            
            guard queryType != .Unknown else {
                output.failedToExecute(reason: "Invalid query type: \(items[0])")
                return false
            }
            
            let A = Int(items[1])
            let B = Int(items[2])
            
            guard let aValue = A, let bValue = B else {
                output.failedToExecute(reason: "Invalid query: \(queryText)")
                return false
            }
            
            guard aValue >= 1, aValue <= nValue, bValue > aValue, bValue <= nValue else {
                output.failedToExecute(reason: "Invalid query (1≦A,B≦N and A≠B): \(queryText)")
                return false
            }
            
            let query = Query(from: aValue, to: bValue, type: queryType, date: index)
            
            queries.append(query)
        }
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            self.executeQueries(queries, n: nValue)
        }
        
        return true
    }
    
    private func executeQueries(_ queries:[Query], n:Int) {
        var outputs = [String]()
        var islands = [Island]()
        for id in 1...n {
            let island = Island(id: id)
            islands.append(island)
        }
        
        queries.forEach { query in
            let islandA = islands[query.from - 1]
            let islandB = islands[query.to - 1]
            
            if query.queryType == .Build {
                if islandA.canBuildBridge(to: islandB) {
                    let bridge = Bridge(from: islandA, to: islandB, date: query.queryDate)
                    islandA.addBridge(bridge)
                    islandB.addBridge(bridge)
                }
            } else if query.queryType == .Check {
                let routes = islandA.bridges.getRoutes(from: islandA, to: islandB)
                let bestRoute = routes.routeWhichOldestBridgeIsNewest
                let outputText: String
                
                if let _ = bestRoute, let oldestBridge = bestRoute?.bridges.oldestBridge {
                    outputText = "YES \(oldestBridge.constructedDate)"
                    oldestBridge.removeFromIslands()
                } else {
                    outputText = "NO"
                }
                outputs.append(outputText)
            }
        }
        
        var outputText = ""
        outputs.forEach { output in
            outputText.append("\(output)\n")
        }
        
        DispatchQueue.main.async {
            self.output.gotResult(outputText)
        }
    }
    
}
