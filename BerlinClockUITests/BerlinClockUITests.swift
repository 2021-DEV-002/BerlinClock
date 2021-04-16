//
//  BerlinClockUITests.swift
//  BerlinClockUITests
//
//  Created by Samy BENGHALEM on 16/04/2021.
//

import XCTest
@testable import BerlinClockUI

class BerlinClockUITests: XCTestCase {
    
    var berlinClock = BerlinClock()

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBerlinClock() {
        XCTAssertEqual("O RROORRRO YYROOOOOOOOYYOO", berlinClock.berlinClock(13, 17, 1))
        XCTAssertEqual("Y RRRRRRRO YYRYYROOOOOYYYY", berlinClock.berlinClock(23, 34, 42))
    }
    
    func testSeconds() {
        XCTAssertEqual("Y", berlinClock.getSeconds(0))
        XCTAssertEqual("O", berlinClock.getSeconds(1))
        XCTAssertEqual("Y", berlinClock.getSeconds(42))
        XCTAssertEqual("O", berlinClock.getSeconds(59))
    }
    
    func testHours() {
        XCTAssertEqual("OOOOOOOO", berlinClock.getHours(0))
        XCTAssertEqual("RROORRRO", berlinClock.getHours(13))
        XCTAssertEqual("RRRRRRRO", berlinClock.getHours(23))
    }
    
    func testMinutes() {
        XCTAssertEqual("YYROOOOOOOOYYOO", berlinClock.getMinutes(17))
        XCTAssertEqual("YYRYYROOOOOYYYY", berlinClock.getMinutes(34))
    }

}
