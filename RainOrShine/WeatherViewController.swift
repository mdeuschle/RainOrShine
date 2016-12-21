//
//  WeatherViewController.swift
//  RainOrShine
//
//  Created by Matt Deuschle on 12/21/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var currentTempLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var currentWeatherImage: UIImageView!
    @IBOutlet var currentWeatherTypeLabel: NSLayoutConstraint!

    @IBOutlet var weatherTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    

}
