//
//  WeatherCell.swift
//  RainOrShine
//
//  Created by Matt Deuschle on 12/22/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet var weatherIcon: UIImageView!
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var weatherTypeLabel: UILabel!
    @IBOutlet var hiTempLabel: UILabel!
    @IBOutlet var loTempLabel: UILabel!

    override func awakeFromNib() {
        weatherIcon.image = UIImage()
        dayLabel.text = ""
        weatherTypeLabel.text = ""
        hiTempLabel.text = ""
        loTempLabel.text = ""
    }

    func configCell(forecast: Forecast) {
        weatherIcon.image = UIImage(named: forecast.weatherType)
        dayLabel.text = forecast.date
        weatherTypeLabel.text = forecast.weatherType
        hiTempLabel.text = forecast.highTemp.degrees
        loTempLabel.text = forecast.lowTemp.degrees
    }


}
