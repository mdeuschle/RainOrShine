//
//  Weather.swift
//  RainOrShine
//
//  Created by Matt Deuschle on 12/21/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import UIKit
import Alamofire

class Weather {

    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!

    var cityName: String {
        if _cityName == nil {
            return ""
        }
        return _cityName
    }

    var date: String {
        if _date == nil {
            return ""
        }
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        let currentDate = formatter.string(from: Date())
        self._date = "Today, \(currentDate)"
        return _date
    }

    var weatherType: String {
        if _weatherType == nil {
            return ""
        }
        return _weatherType
    }

    var currentTemp: Double {
        if _currentTemp == nil {
            return 0.0
        }
        return _currentTemp
    }

    func downloadWeatherData(completed: DownloadComplete) {

        let url = URL(string: currentWeatherURL)!
        Alamofire.request(url).responseJSON { response in
            if let dic = response.result.value as? [String: Any] {

                if let name = dic["name"] as? String {
                    self._cityName = name.capitalized
                }

                if let weather = dic["weather"] as? [[String: Any]] {
                    if let main = weather[0]["main"] as? String {
                        self._weatherType = main.capitalized
                    }
                }

                if let main = dic["main"] as? [String: Any] {
                    if let temp = main["temp"] as? Double {
                        let kelvin = (temp * (9/5) - 459.67)
                        let kelvin2Far = Double(round(10 * kelvin/10))
                        self._currentTemp = kelvin2Far
                    }
                }
            }
        }
        completed()
    }















}
