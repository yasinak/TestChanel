//
//  ForecastWeathersPresenterTests.swift
//  TestChanelTests
//
//  Created by Yasin Akinci on 10/12/2019.
//  Copyright © 2019 Yasin Akinci. All rights reserved.
//

import XCTest
import Alamofire
@testable import TestChanel

class ForecastWeathersPresenterTests: XCTestCase {

    let forecastWeathersPresenter = ForecastWeathersPresenter()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testForecastWeathersPresenter() {
        let e = expectation(description: "fetchForecastWeatherDataForCity")
        //  2968815 is the id of Paris city
        forecastWeathersPresenter.fetchForecastWeatherDataForCity(id: "2968815", completion: {
            e.fulfill()
        })
        waitForExpectations(timeout: 5.0, handler: nil)
    }
    
    func testForecastWeatherListModel() {
        
        guard let path = Bundle(for: type(of: self)).path(forResource: "ForecastWeatherList", ofType: "json") else {
            fatalError("ForecastWeatherList.json not found") }
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let response = try JSONDecoder().decode(ForecastWeatherList.self, from: data)

            XCTAssertNotNil(response.cnt, "cnt ok")
            XCTAssertNotNil(response.list, "list ok")
        } catch {
            fatalError("ForecastWeatherList.json file format not correct")
        }
    }

}
