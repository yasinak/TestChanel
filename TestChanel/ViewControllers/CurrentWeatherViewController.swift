//
//  CurrentWeatherViewController.swift
//  TestChanel
//
//  Created by Yasin Akinci on 08/12/2019.
//  Copyright © 2019 Yasin Akinci. All rights reserved.
//

import UIKit
import AlamofireImage

class CurrentWeatherViewController: UIViewController {

    @IBOutlet weak var citiesTableView: UITableView!
    
    let weatherPresenter = CurrentWeathersPresenter()
    
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Weather in France"
        
        citiesTableView.register(UINib(nibName: "WeatherCityTableViewCell", bundle: nil), forCellReuseIdentifier: "WeatherCityTableViewCell")
        citiesTableView.tableFooterView = UIView()
        weatherPresenter.fetchCurrentWeatherData { [weak self] in
            self?.citiesTableView.reloadData()
        }
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? ForcastWeatherViewController, let indexPath = sender as? IndexPath {
            viewController.list = weatherPresenter.getWeatherCityFor(index: indexPath.row)
        }
    }
    
}

// MARK: - UITableViewDataSource
extension CurrentWeatherViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return weatherPresenter.getCityCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "WeatherCityTableViewCell") as? WeatherCityTableViewCell {

            if let weatherCityData = weatherPresenter.getWeatherCityFor(index: indexPath.row) {
                cell.setupCell(weatherCityData: weatherCityData)
            }
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
}

// MARK: - UITableViewDelegate
extension CurrentWeatherViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.performSegue(withIdentifier: "gotoDetailViewController", sender: indexPath)
    }
}
