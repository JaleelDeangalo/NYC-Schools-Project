//
//  NYC_Schools_ProjectUITests.swift
//  NYC Schools ProjectUITests
//
//  Created by Jaleel Gilbert on 9/5/23.
//

import XCTest

final class NYC_Schools_ProjectUITests: XCTestCase {

    
  
    override func setUpWithError() throws {
        
       
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    
    func testSchoolsAPIUrl() {
        
      let url = URL(string: "https://data.cityofnewyork.us/resource/s3k6-pzi2.json?$limit=\(30)&$offset=\(3)")
        
        XCTAssertNotNil(url)
        
    }
    
    func testSchoolsSATScoresAPIUrl() async {
        
      let url = URL(string: "https://data.cityofnewyork.us/resource/f9bf-2cp4.json?dbn=\("")")
        
        XCTAssertNotNil(url)
       
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
