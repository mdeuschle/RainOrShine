//
//  Location.swift
//  RainOrShine
//
//  Created by Matt Deuschle on 12/23/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import Foundation

class Location {

    static var sharedInstance = Location()
    private init() { }

    var lat: Double!
    var lon: Double!

}
