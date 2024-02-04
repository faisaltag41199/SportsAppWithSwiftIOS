//
//  DateForURLTest.swift
//  SportsAppTests
//
//  Created by Faisal TagEldeen on 04/02/2024.
//

import XCTest
@testable import SportsApp

final class DateForURLTest: XCTestCase {

    var endPointHelper = EndPointURLDateHelper()
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testToDateReturnDateInString(){
        
        var stringDateResult = endPointHelper.toDate(todayDate: Date())
        
        XCTAssert(type(of: stringDateResult) == type(of:"String"),"testToDateReturnDateInString not string type")
    }
    
    func testFromDateReturnDateInString(){
        
        var stringDateResult = endPointHelper.fromDate(todayDate: Date())
        
        XCTAssert(type(of: stringDateResult) == type(of:"String"),"testToDateReturnDateInString not string type")

    }
    


}
