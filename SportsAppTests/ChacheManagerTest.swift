//
//  ChacheManagerTest.swift
//  SportsAppTests
//
//  Created by Faisal TagEldeen on 04/02/2024.
//

import XCTest
@testable import SportsApp

final class ChacheManagerTest: XCTestCase {

    var chacheManager = CachingManagerImplementation()
    
    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
        
    }
    
    func testFetchLeaguesResult(){
        
        var result:[LeagueModel]?
        result = chacheManager.fetch()
        
        XCTAssert(result?.count != 0 , "fetch result from core data not working")
    
    }
    
    
}
