//
//  OutputTests.swift
//  IslandBridgeConstructor
//
//  Created by Chavalit Vanasapdamrong on 3/20/2560 BE.
//  Copyright © 2560 Chavalit Vanasapdamrong. All rights reserved.
//

import XCTest
@testable import IslandBridgeConstructor

class OutputTests: XCTestCase {
    
    var presenter: MainPresenter?
    var interactor: MainInteractor?
    var router: MainRouter?
    
    override func setUp() {
        super.setUp()
        presenter = MainPresenter()
        interactor = MainInteractor()
        router = MainRouter()
        
        presenter?.interactor = interactor
        presenter?.router = router
        interactor?.output = presenter
    }
    
    override func tearDown() {
        presenter = nil
        interactor = nil
        router = nil
        super.tearDown()
    }
    
    func testFlowAndOutput1() {
        let inputText = "5 7\nbuild 1 2\ncheck 1 2\nbuild 2 3\ncheck 1 2\nbuild 3 4\ncheck 2 4\ncheck 1 5"
        let outputText = "YES 1\nNO\nYES 3\nNO\n"
        
        let queries = interactor!.initializeQueries(input: inputText)
        XCTAssertTrue(queries.0)
        
        if let data1 = queries.1, let nValue = queries.2 {
            let result = interactor?.executeQueries(data1, n: nValue)
            XCTAssertEqual(result, outputText)
        } else {
            XCTFail()
        }
    }
    
    func testFlowAndOutput2() {
        let inputText = "3 7\nbuild 1 3\nbuild 1 2\nbuild 2 3\ncheck 1 3\ncheck 1 3\ncheck 1 3\ncheck 2 3"
        let outputText = "YES 2\nYES 1\nNO\nYES 3\n"
        
        let queries = interactor!.initializeQueries(input: inputText)
        XCTAssertTrue(queries.0)
        
        if let data1 = queries.1, let nValue = queries.2 {
            let result = interactor?.executeQueries(data1, n: nValue)
            XCTAssertEqual(result, outputText)
        } else {
            XCTFail()
        }
    }
    
}
