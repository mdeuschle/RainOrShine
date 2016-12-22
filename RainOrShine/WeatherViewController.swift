//
//  WeatherViewController.swift
//  RainOrShine
//
//  Created by Matt Deuschle on 12/21/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var currentTempLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var currentWeatherImage: UIImageView!
    @IBOutlet var currentWeatherTypeLabel: NSLayoutConstraint!
    @IBOutlet var weatherTableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()

        Weather().downloadWeatherData { 
            
        }


    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell") else {
            return UITableViewCell()
        }
        return cell
    }

    

}
