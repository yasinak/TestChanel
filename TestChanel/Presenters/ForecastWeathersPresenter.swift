//
//  ForecastWeathersPresenter.swift
//  TestChanel
//
//  Created by Yasin Akinci on 09/12/2019.
//  Copyright © 2019 Yasin Akinci. All rights reserved.
//

import UIKit
import Alamofire

final class ForecastWeathersPresenter: NSObject {

    private var weatherCityList: [List]?

    //MARK: - Methods to fetch the forecast weather for a city from the webservice
    func fetchForecastWeatherDataForCity(id: String, completion: @escaping () -> Void) {
        Alamofire.request(URLs.fiveDaysWeatherForecastUrl(id: id)).responseData { [weak self] response in
            switch response.result {
            case .success:
                if let data = response.data {
                    do {
                        let weatherList = try JSONDecoder().decode(ForecastWeatherList.self, from: data)
                        self?.weatherCityList = weatherList.list
                        completion()
                    } catch {
                        print("WeatherList decode ERROR")
                    }
                }
            case .failure:
                print("REQUEST FAILED")
            }
        }
    }
    
    func getForcastWeatherFor(index:Int) -> List? {
        return weatherCityList?[index]
    }
    
    func getForecastWeatherCount() -> Int {
        return weatherCityList?.count ?? 0
    }
}
