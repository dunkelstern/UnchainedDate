//
//  date.swift
//  twohundred
//
//  Created by Johannes Schriewer on 26/11/15.
//  Copyright © 2015 Johannes Schriewer. All rights reserved.
//

import Foundation

import XCTest
@testable import UnchainedDate

class dateTests: XCTestCase {
    
    func testISODateParsing() throws {
        if let date = Date(isoDateString: "1984-01-24T12:34:00Z") {
            XCTAssert(date.timestamp == 443795640)
        } else {
            XCTFail("Failure to parse date")
        }
    }
    
    func testTimeStampToISODate() throws {
        let date = Date(timestamp: 443795640)
        XCTAssertNotNil(date.isoDateString)
        XCTAssert(date.isoDateString == "1984-01-24T12:34:00Z")
    }
    
    func testRFC822DateParsing() throws {
        if let date = Date(rfc822DateString: "Tue, 24 Jan 1984 12:34:00 +0000") {
            XCTAssert(date.timestamp == 443795640, "\(date.timestamp) != 443795640")
        } else {
            XCTFail("Failure to parse date")
        }
    }
    
    func testTimeStampToRFC822Date() throws {
        let date = Date(timestamp: 443795640)
        XCTAssertNotNil(date.isoDateString)
        XCTAssert(date.rfc822DateString == "Tue, 24 Jan 1984 12:34:00 +0000")
    }

}

#if os(Linux)
extension dateTests {
    static var allTests : [(String, dateTests -> () throws -> Void)] {
        return [
            ("testISODateParsing", testISODateParsing),
            ("testTimeStampToISODate", testTimeStampToISODate),
            ("testRFC822DateParsing", testRFC822DateParsing),
            ("testTimeStampToRFC822Date", testTimeStampToRFC822Date)
        ]
    }
}
#endif