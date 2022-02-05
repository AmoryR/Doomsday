//
//  Day.swift
//  Doomsday
//
//  Created by Amory Rouault on 30/01/2022.
//

import Foundation

public enum Day: String {
    case monday = "monday"
    case tuesday = "tuesday"
    case wednesday = "wednesday"
    case thursday = "thursday"
    case friday = "friday"
    case saturday = "saturday"
    case sunday = "sunday"
    

    static func getIndexFrom(day: Day) -> Int {
        switch day {
        case .monday:
            return 1
        case .tuesday:
            return 2
        case .wednesday:
            return 3
        case .thursday:
            return 4
        case .friday:
            return 5
        case .saturday:
            return 6
        case .sunday:
            return 0
        }
    }
    
    static func getDayFrom(index: Int) -> Day {
        switch index {
        case 0:
            return .sunday
        case 1:
            return .monday
        case 2:
            return .tuesday
        case 3:
            return .wednesday
        case 4:
            return .thursday
        case 5:
            return .friday
        case 6:
            return .saturday
        default:
            fatalError("Day index must be between 0 and 6. Found: \(index)")
        }
    }
}


