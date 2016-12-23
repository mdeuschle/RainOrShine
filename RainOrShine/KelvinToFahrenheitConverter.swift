//
//  KelvinToFahrenheitConverter.swift
//  RainOrShine
//
//  Created by Matt Deuschle on 12/22/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import Foundation

class KelvinToFahrenheitConverter {

    var kelvin: Double

    init(kelvin: Double) {
        self.kelvin = kelvin
    }

    func convertKToF() -> Double {
        let kelvin = (self.kelvin * (9/5) - 459.67)
        return Double(round(10 * kelvin/10))
    }
}





