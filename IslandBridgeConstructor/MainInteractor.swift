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
    
    func executeLogic(input: String) {
        let result = initializeQueries(input: input)
        if result.0, let queries = result.1, let nValue = result.2 {
            let group = DispatchGroup()
            group.enter()
            var result = ""
            DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
                result = self.executeQueries(queries, n: nValue)
                group.leave()
            }
            group.notify(queue: .main) {
                self.output.gotResult(result)
            }
        } else {
            self.output.failedToExecute(reason: result.3)
        }
    }
    
    func initializeQueries(input: String) -> (Bool, [Query]?, Int?, String?) {
        let lines = input.lines
        
        guard lines.count > 1 else {
            return (false, nil, nil, nil)
        }
        
        let initialQuery = lines[0].trimSpace
        let initialItems = initialQuery.items
        
        guard initialItems.count == 2 else {
            return (false, nil, nil, nil)
        }
        
        let N = Int(initialItems[0])
        let Q = Int(initialItems[1])
        
        guard let nValue = N, let qValue = Q else {
            return (false, nil, nil, "Invalid query: \(initialQuery)")
        }
        
        guard nValue >= 1, nValue <= 50 else {
            return (false, nil, nil, "Invalid query N (1 ≦ N ≦ 50): \(initialQuery)")
        }
        
        guard qValue >= 1, qValue <= 500 else {
            return (false, nil, nil, "Invalid query Q (1 ≦ Q ≦ 500): \(initialQuery)")
        }
        
        guard qValue == lines.count - 1 else {
            return (false, nil, nil, "Total queries doesn't match Q: Expected:\(qValue), Actual:\(lines.count - 1)")
        }
        
        var queries = [Query]()
        for index in 1..<lines.count {
            
            let queryText = lines[index].trimSpace
            let items = queryText.items
            
            guard items.count == 3 else {
                return (false, nil, nil, "Invalid query: \(queryText)")
            }
            
            let queryType = QueryType.fromString(items[0])
            
            guard queryType != .Unknown else {
                return (false, nil, nil, "Invalid query type: \(items[0])")
            }
            
            let A = Int(items[1])
            let B = Int(items[2])
            
            guard let aValue = A, let bValue = B else {
                return (false, nil, nil, "Invalid query: \(queryText)")
            }
            
            guard aValue >= 1, aValue <= nValue, bValue > aValue, bValue <= nValue else {
                return (false, nil, nil, "Invalid query (1≦A,B≦N and A≠B): \(queryText)")
            }
            
            let query = Query(from: aValue, to: bValue, type: queryType, date: index)
            
            queries.append(query)
        }
        return (true, queries, nValue, nil)
    }
    
    func executeQueries(_ queries:[Query], n:Int) -> String {
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
        
        return outputText
    }
    
}
