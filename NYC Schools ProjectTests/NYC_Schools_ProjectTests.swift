//
//  NYC_Schools_ProjectTests.swift
//  NYC Schools ProjectTests
//
//  Created by Jaleel Gilbert on 9/5/23.
//

import XCTest
@testable import NYC_Schools_Project

final class NYC_Schools_ProjectTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testSchoolsAPIUrl() {
        
      let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json?$limit=\(30)&$offset=\(3)")
        
        XCTAssertNotNil(url)
        
    }
    
    func testSchoolsSATScoresAPIUrl() async {
        
      let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\("")")
        
        XCTAssertNotNil(url)
       
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
