//
//  APIManagerTest.swift
//  SportsAppTests
//
//  Created by Faisal TagEldeen on 04/02/2024.
//

import XCTest
@testable import SportsApp

final class APIManagerTest: XCTestCase {

    var apiManager = APIManagerImplementation<LeaguesModel>()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFetchResult(){
        
        var url = "https://apiv2.allsportsapi.com/football/?met=Leagues&APIkey=8132dccaae636f7e14376c57ef9696533417da120f141d29247f12a148ee7cda"
        
        var expectationObject = expectation(description: "wating for api")
        
        apiManager.fetchData(handler: { result, errorStatus in

            XCTAssert(result != nil)
            expectationObject.fulfill()
            
        }, url: url)
        
        waitForExpectations(timeout: 20)
    }
}

