//
//  WeatherViewController.swift
//  RainOrShine
//
//  Created by Matt Deuschle on 12/21/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import UIKit
import Alamofire

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var currentTempLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var currentWeatherImage: UIImageView!
    @IBOutlet var currentWeatherTypeLabel: UILabel!
    @IBOutlet var weatherTableView: UITableView!

    var currentWeather: Weather!
    var forecastWeather: Forecast!
    var forecasts = [Forecast]()

    override func viewDidLoad() {
        super.viewDidLoad()
        currentWeather = Weather()
        currentWeather.downloadWeatherData {
            self.getForecast {
                self.updateUI()
            }
        }
    }

    func updateUI() {
        dateLabel.text = currentWeather.date
        currentTempLabel.text = String(currentWeather.currentTemp)
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
                            print("OBJ: \(obj)")
                        }
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
