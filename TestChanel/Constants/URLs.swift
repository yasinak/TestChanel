//
//  URLs.swift
//  TestChanel
//
//  Created by Yasin Akinci on 09/12/2019.
//  Copyright © 2019 Yasin Akinci. All rights reserved.
//

import Foundation

struct URLs {
    private static let HOST = "http://api.openweathermap.org"
    static let iconUrlPart1 = "http://openweathermap.org/img/w/"
    static let iconUrlPart2 = ".png"
    private static let CURRENT_WEATHER_SERVICE = "/data/2.5/group?"
    private static let FIVE_DAYS_WEATHER_FORECAST_SERVICE = "/data/2.5/forecast?"
    private static let CITIES_KEY = "id="
    private static let CITIES_VALUES: [String] = ["2968815",//  Paris
                                                  "6454573",//  Lyon
                                                  "6447142",//  Marseille
                                                  "6455058",//  Bordeaux
                                                  "6453974",//  Toulouse
                                                  "6434483"//   Nantes
    ]
    private static var CITIES: String {
        return CITIES_KEY+CITIES_VALUES.joined(separator: ",")
    }
    private static var UNITS_PARAMETER = "&units=metric"
    private static let OPENWEATHERMAPAPI_KEY = "&appid="
    private static let OPENWEATHERMAPAPI_VALUE = "0d7db3b5be75f90a0250f6d49be7c837"
    private static var OPENWEATHERMAPAPI_PARAMETER: String {
        return OPENWEATHERMAPAPI_KEY+OPENWEATHERMAPAPI_VALUE
    }

    static func fiveDaysWeatherForecastUrl(id:String) -> String{
        return HOST+FIVE_DAYS_WEATHER_FORECAST_SERVICE+CITIES_KEY+id+UNITS_PARAMETER+OPENWEATHERMAPAPI_PARAMETER
    }
    
    static func currentWeatherUrl() -> String{
        return HOST+CURRENT_WEATHER_SERVICE+CITIES+UNITS_PARAMETER+OPENWEATHERMAPAPI_PARAMETER
    }
}
