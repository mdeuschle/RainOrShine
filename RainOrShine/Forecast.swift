//
//  Forecast.swift
//  RainOrShine
//
//  Created by Matt Deuschle on 12/22/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import UIKit

class Forecast {

    private var _date: String!
    private var _weatherType: String!
    private var _lowTemp: Double!
    private var _highTemp: Double!

    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }

    var weatherType: String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }

    var lowTemp: Double {
        if _lowTemp == nil {
            _lowTemp = 0.0
        }
        return _lowTemp
    }

    var highTemp: Double {
        if _highTemp == nil {
            _highTemp = 0.0
        }
        return _highTemp
    }

    init(forecastDic: [String: Any]) {

        if let temp = forecastDic["temp"] as? [String: Any] {

            if let min = temp["min"] as? Double {
                self._lowTemp = KelvinToFahrenheitConverter(kelvin: min).convertKToF()
            }
            if let max = temp["max"] as? Double {
                self._highTemp = KelvinToFahrenheitConverter(kelvin: max).convertKToF()
            }
        }

        if let weather = forecastDic["weather"] as? [[String: Any]] {
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }

        if let unixDate = forecastDic["dt"] as? Double {
            let date = Date(timeIntervalSince1970: unixDate)
            self._date = date.daysOfTheWeek()
        }
    }
}
















