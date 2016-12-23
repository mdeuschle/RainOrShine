//
//  WeatherViewController.swift
//  RainOrShine
//
//  Created by Matt Deuschle on 12/21/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, CLLocationManagerDelegate {

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var currentTempLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var currentWeatherImage: UIImageView!
    @IBOutlet var currentWeatherTypeLabel: UILabel!
    @IBOutlet var weatherTableView: UITableView!

    var currentWeather: Weather!
    var forecastWeather: Forecast!
    var forecasts = [Forecast]()
    var locationManger = CLLocationManager()
    var currentLocation: CLLocation!

    override func viewDidLoad() {
        super.viewDidLoad()
        configLocactionManager()
        currentWeather = Weather()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationAuthStatus()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        clearDataOnLoad()
    }

    func clearDataOnLoad() {
        dateLabel.text = ""
        currentTempLabel.text = ""
        cityLabel.text = ""
        currentWeatherTypeLabel.text = ""
        currentWeatherImage.image = UIImage()
    }

    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            if let currentLoc = locationManger.location {
                currentLocation = currentLoc
                Location.sharedInstance.lat = currentLocation.coordinate.latitude
                Location.sharedInstance.lon = currentLocation.coordinate.longitude
                currentWeather.downloadWeatherData {
                    self.getForecast {
                        self.updateUI()
                    }
                }
            }
        } else {
            locationManger.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }

    func configLocactionManager() {
        locationManger.delegate = self
        locationManger.desiredAccuracy = kCLLocationAccuracyBest
        locationManger.requestWhenInUseAuthorization()
        locationManger.startMonitoringSignificantLocationChanges()
    }

    func updateUI() {
        dateLabel.text = currentWeather.date
        currentTempLabel.text = currentWeather.currentTemp.degrees
        cityLabel.text = currentWeather.cityName
        currentWeatherTypeLabel.text = currentWeather.weatherType
        currentWeatherImage.image = UIImage(named: currentWeather.weatherType)
    }

    func getForecast(completed: @escaping DownloadComplete) {
        if let url = URL(string: forecastURL) {
            Alamofire.request(url).responseJSON { response in
                if let dic = response.result.value as? [String: Any] {
                    if let list = dic["list"] as? [[String: Any]] {
                        for obj in list {
                            let forecast = Forecast(forecastDic: obj)
                            self.forecasts.append(forecast)
                        }
                        self.forecasts.remove(at: 0)
                        self.weatherTableView.reloadData()
                    }
                }
                completed()
            }
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell") as? WeatherCell else {
            return UITableViewCell()
        }
        let forecast = forecasts[indexPath.row]
        cell.configCell(forecast: forecast)
        return cell
    }
    
    
    
}
