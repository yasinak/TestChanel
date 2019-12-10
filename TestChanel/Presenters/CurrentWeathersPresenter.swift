//
//  WeathersPresenter.swift
//  TestChanel
//
//  Created by Yasin Akinci on 08/12/2019.
//  Copyright © 2019 Yasin Akinci. All rights reserved.
//

import UIKit
import Alamofire

final class CurrentWeathersPresenter {
    
    var weatherCityList: [List]?
    
    //MARK: - Methods to fetch the current weather data for few cities from the webservice
    func fetchCurrentWeatherData(completion: @escaping () -> Void) {
        Alamofire.request(URLs.currentWeatherUrl()).responseData { [weak self] response in
            switch response.result {
            case .success:
                if let data = response.data{
                    do {
                        let weatherList = try JSONDecoder().decode(CurrentWeatherList.self, from: data)
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
    
    func getWeatherCityFor(index:Int) -> List? {
        return weatherCityList?[index]
    }
    
    func getCityCount() -> Int {
        return weatherCityList?.count ?? 0
    }
    
    
    //MARK: -Methods to get the URL of a icon
    func getIconURL(code:String)-> URL? {
        return URL(string: URLs.iconUrl+code+URLs.iconUrlExtension)
    }
    
}
