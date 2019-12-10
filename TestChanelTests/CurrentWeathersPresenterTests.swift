//
//  CurrentWeathersPresenterTests.swift
//  TestChanelTests
//
//  Created by Yasin Akinci on 08/12/2019.
//  Copyright © 2019 Yasin Akinci. All rights reserved.
//

import XCTest
import Alamofire
@testable import TestChanel

class CurrentWeathersPresenterTests: XCTestCase {

    let currentWeathersPresenter = CurrentWeathersPresenter()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCurrentWeathersPresenter() {
        let e = expectation(description: "fetchCurrentWeatherData")
        currentWeathersPresenter.fetchCurrentWeatherData {
            e.fulfill()
        }
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testCurrentWeatherModel() {
        
        guard let path = Bundle(for: type(of: self)).path(forResource: "CurrentWeather", ofType: "json") else {
            fatalError("CurrentWeather.json not found") }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let response = try JSONDecoder().decode(CurrentWeatherList.self, from: data)

            XCTAssertNotNil(response.cnt, "cnt ok")
            XCTAssertNotNil(response.list, "list ok")
        } catch {
            fatalError("CurrentWeather.json file format not correct")
        }
    }

}
