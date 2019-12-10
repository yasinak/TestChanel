//
//  ForecastWeatherTableViewCell.swift
//  TestChanel
//
//  Created by Yasin Akinci on 09/12/2019.
//  Copyright © 2019 Yasin Akinci. All rights reserved.
//

import UIKit

class ForecastWeatherTableViewCell: UITableViewCell {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
        
    func setupCell(weatherCityData: List) {
        dateLabel.text = weatherCityData.dt?.getDateFromTimeStamp()
        timeLabel.text = weatherCityData.dt?.getTimeFromTimeStamp()
        descriptionLabel.text = weatherCityData.weather?[0].main ?? ""
        temperatureLabel.text = "Temperature: \(weatherCityData.main?.temp ?? 0)°"
        humidityLabel.text = "Humidity Level: \(weatherCityData.main?.humidity ?? 0)"
        if let iconCode =  weatherCityData.weather?[0].icon, let iconURL = CurrentWeathersPresenter().getIconURL(code: iconCode) {
            weatherImageView.af_setImage(withURL: iconURL)
        }
    }
    
}
