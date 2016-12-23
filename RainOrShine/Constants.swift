//
//  Constants.swift
//  RainOrShine
//
//  Created by Matt Deuschle on 12/21/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import Foundation

let baseURL = "http://api.openweathermap.org/data/2.5/"
let appID = "&appid="
let apiKey = "410f10b49176eef3db7a6fe196ec891c"
let currentWeatherURL = "\(baseURL)weather?lat=\(Location.sharedInstance.lat!)&lon=\(Location.sharedInstance.lon!)\(appID)\(apiKey)"
let forecastURL = "\(baseURL)forecast/daily?lat=\(Location.sharedInstance.lat!)&lon=\(Location.sharedInstance.lon!)&cnt=10&mode=json\(appID)\(apiKey)"

typealias DownloadComplete = () -> ()
