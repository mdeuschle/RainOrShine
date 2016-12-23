//
//  Constants.swift
//  RainOrShine
//
//  Created by Matt Deuschle on 12/21/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import Foundation

let baseURL = "http://api.openweathermap.org/data/2.5/weather?"
let forecastURL = "http://api.openweathermap.org/data/2.5/forecast/daily?lat=35&lon=139&cnt=10&mode=json&appid=410f10b49176eef3db7a6fe196ec891c"

let lat = "lat="
let lon = "&lon="
let appID = "&appid="
let apiKey = "410f10b49176eef3db7a6fe196ec891c"
let currentWeatherURL = "\(baseURL)\(lat)35\(lon)139\(appID)\(apiKey)"

typealias DownloadComplete = () -> ()
