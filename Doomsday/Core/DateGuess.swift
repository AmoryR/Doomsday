//
//  DateGuess.swift
//  Doomsday
//
//  Created by Amory Rouault on 30/01/2022.
//

import Foundation

class DateGuess {
    
    private let calendar = Calendar.current
    
    func guess(date: Date, day: Days) -> GuessResult {
        
        let components = self.calendar.dateComponents([.year], from: date)
        
        // 1. Determine Doomsday day for date.getFullYear()
        let centuryDoomsday = self.getDoomsdayForCenturyOf(year: UInt(components.year!))
        
        // TODO: Get yearDoomsday from centuryDoomsday
        
        // 2. Get clostest special date from date and make the difference
        
        // 3. Add difference to Doomsday day
        
        // 4. Check result
        
        return .success
    }
    
    private func getDoomsdayForCenturyOf(year: UInt) -> Days {
        
        let century = Int(year / 100)
        
        // Facts
        // 1900 -> Wednesday
        // 1800 -> Friday
        // 1700 -> Sunday
        // 1600 -> Tuesday
        
        // This pattern repeats so I can use modulation
        
        switch century % 4 {
        case 3:
            return .wednesday
        case 2:
            return .friday
        case 1:
            return .sunday
        case 0:
            return .tuesday
        default:
            fatalError("Error in century modulation")
        }
    }
    
}
