//
//  DateFormatter.swift
//  RainOrShine
//
//  Created by Matt Deuschle on 12/22/16.
//  Copyright © 2016 Matt Deuschle. All rights reserved.
//

import Foundation

extension Date {
    func daysOfTheWeek() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        return formatter.string(from: self)
    }
}
