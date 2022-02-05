//
//  DoomsdayTests.swift
//  DoomsdayTests
//
//  Created by Amory Rouault on 03/02/2022.
//

import XCTest
@testable import Doomsday

class DoomsdayTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // Make test for every step of date guessing
    
    func testDate() throws {
        
        
        // 2020-03-03 => Tuesday
        // 1998-04-17 => Friday
        // 1599-04-04 => Sunday
        
        let guessingDate = DayGuessService()
        let result = guessingDate.guess(date: Date.parse("1998-04-17"), day: .friday)
        XCTAssertEqual(result.result, .success, "Test")

        let result2 = guessingDate.guess(date: Date.parse("2020-04-03"), day: .friday)
        XCTAssertEqual(result2.result, .success, "Test")

        let result3 = guessingDate.guess(date: Date.parse("2020-04-05"), day: .sunday)
        XCTAssertEqual(result3.result, .success, "Test")

        let result4 = guessingDate.guess(date: Date.parse("2020-04-06"), day: .monday)
        XCTAssertEqual(result4.result, .success, "Test")

        let result5 = guessingDate.guess(date: Date.parse("1599-04-04"), day: .sunday)
        XCTAssertEqual(result5.result, .success, "Test")
        
        let result6 = guessingDate.guess(date: Date.parse("1962-03-05"), day: .monday)
        XCTAssertEqual(result6.result, .success, "Test")
        
        let result7 = guessingDate.guess(date: Date.parse("1962-03-02"), day: .friday)
        XCTAssertEqual(result7.result, .success, "Test")
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
