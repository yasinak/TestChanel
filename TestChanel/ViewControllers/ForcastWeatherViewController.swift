//
//  ForcastWeatherViewController.swift
//  TestChanel
//
//  Created by Yasin Akinci on 08/12/2019.
//  Copyright © 2019 Yasin Akinci. All rights reserved.
//

import UIKit

class ForcastWeatherViewController: UIViewController {

    @IBOutlet weak var weatherTableView: UITableView!
    
    let forecastWeatherPresenter = ForecastWeathersPresenter()
    //  list value get in the previous viewController
    var list: List?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = list?.name {
            self.title = "Weather of \(name)"
        }
        weatherTableView.register(UINib(nibName: "ForecastWeatherTableViewCell", bundle: nil), forCellReuseIdentifier: "ForecastWeatherTableViewCell")
        weatherTableView.tableFooterView = UIView()
        if let cityId = list?.id {
            forecastWeatherPresenter.fetchForecastWeatherDataForCity(id: "\(cityId)") { [weak self] in
                self?.weatherTableView.reloadData()
            }
        }
    }

}

// MARK: - UITableViewDataSource
extension ForcastWeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecastWeatherPresenter.getForecastWeatherCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ForecastWeatherTableViewCell") as? ForecastWeatherTableViewCell {

            if let weatherCityData = forecastWeatherPresenter.getForcastWeatherFor(index: indexPath.row) {
                cell.setupCell(weatherCityData: weatherCityData)
            }
            return cell
        } else {
            return UITableViewCell()
        }
    }
}

// MARK: - UITableViewDelegate
extension ForcastWeatherViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
