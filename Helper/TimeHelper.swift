//
//  TimeHelper.swift
//  Recipe Book
//
//  Created by Moladin on 15/11/2025.
//

import Foundation

struct TimeHelper{
    static func hoursText(totalMinutes: Int) -> String{
        let hours = totalMinutes / 60
        let minutes = totalMinutes % 60

        switch (hours, minutes) {
        case (0, let m):
            return "\(m) min"
        case (let h, 0):
            return "\(h)h"
        default:
            return "\(hours)h \(minutes) min"
        }
    }
}
