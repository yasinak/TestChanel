//
//  WeatherCityTableViewCell.swift
//  TestChanel
//
//  Created by Yasin Akinci on 08/12/2019.
//  Copyright © 2019 Yasin Akinci. All rights reserved.
//

import UIKit

class WeatherCityTableViewCell: UITableViewCell {

    @IBOutlet weak var weatherImageView: UIImageView!
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func awakeFromNib() {
        isAccessibilityElement = true
    }
    
    func setupCell(weatherCityData : List) {
        isAccessibilityElement = true
        cityNameLabel.text = weatherCityData.name
        weatherDescriptionLabel.text = weatherCityData.weather?[0].main ?? ""
        temperatureLabel.text = "Temperature: \(weatherCityData.main?.temp ?? 0)°"
        if let iconCode =  weatherCityData.weather?[0].icon, let iconURL = CurrentWeathersPresenter().getIconURL(code: iconCode) {
            weatherImageView.af_setImage(withURL: iconURL)
        }
    }
    
}
