//
//  TestChanelUITests.swift
//  TestChanelUITests
//
//  Created by Yasin Akinci on 08/12/2019.
//  Copyright © 2019 Yasin Akinci. All rights reserved.
//

import XCTest

class TestChanelUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testForcastWeatherViewController() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        XCTAssertNotEqual(app.tables.cells.count, 0, "We have 0 cell in the tableview of CurrentWeatherViewController !!!")
        XCUIApplication().tables.cells.firstMatch.tap()
        XCTAssertNotEqual(app.tables.cells.count, 0, "We have 0 cell in the tableview of ForcastWeatherViewController !!!")
        XCUIApplication().tables.cells.firstMatch.tap()
        app.terminate()
    }

}
