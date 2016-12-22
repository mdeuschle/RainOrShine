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
}
