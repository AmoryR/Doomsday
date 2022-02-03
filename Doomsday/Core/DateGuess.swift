//
//  DateGuess.swift
//  Doomsday
//
//  Created by Amory Rouault on 30/01/2022.
//

import Foundation

class DateGuess {
    
    // All this dates share the same doomsday
    // Format: MM-dd
    private var specialDatesString: [String] = [
        "4-4",
        "6-6",
        "8-8",
        "10-10",
        "12-12",
        "9-5",
        "5-9",
        "7-11",
        "11-7",
        
        "3-14", // PI day
        "7-4", // Independence day
        "10-31", // Halloween
        "12-26" // Boxing day
    ]
    private var specialDates: [Date] = []
    
    private let calendar = Calendar.current
    
    init() {
        
    }
    
    private func setSpecialsDates(year: UInt) {
        
        if self.specialDatesString.count != 13 {
            return
        }
        
        if self.isLeap(year: year) {
            self.specialDatesString.append("1-4")
            self.specialDatesString.append("2-29")
        } else {
            self.specialDatesString.append("1-3")
            self.specialDatesString.append("2-28")
        }
        
        self.populateSpecialDates(year: year)
        
    }
    
    private func populateSpecialDates(year: UInt) {
        if self.specialDates.count == 0 {
            for dateString in self.specialDatesString {
                self.specialDates.append(Date.parse("\(year)-\(dateString)"))
            }
        }
    }
    
    private func isLeap(year: UInt) -> Bool {
        return false
    }
    
    func guess(date: Date, day: Days) -> GuessResult {
        
        let components = self.calendar.dateComponents([.year], from: date)
        self.setSpecialsDates(year: UInt(components.year!))
        
        // 1. Determine Doomsday day for date.getFullYear()
        let centuryDoomsday = self.getDoomsdayForCenturyOf(year: UInt(components.year!))
        
        // TODO: Get yearDoomsday from centuryDoomsday
        let yearDoomsday = self.getYearDoomsday(centuryDoomsyear: centuryDoomsday, year: UInt(components.year!))
        let doomsdayDayIndex = getIndexFromDay(day: yearDoomsday)
        
        // 2. Get clostest special date from date and make the difference
        let clostest = self.getClostestSpecialDateOf(date: date)
        
        // 3. Add difference to Doomsday day
        if let difference = self.calendar.dateComponents([.day], from: calendar.startOfDay(for: date), to: calendar.startOfDay(for: clostest)).day {
            
            // 4. Check result
            let result = getDayFromIndex(index: abs(doomsdayDayIndex - difference) % 7)
            
            if result == day {
                return .success
            } else {
                return .fail
            }
            
        }
        
        
        // Tell that is because there is an error
        return .fail
    }
    
    private func getClostestSpecialDateOf(date: Date) -> Date {
        
        var clostest: Date?
        
        
        for specialDate in specialDates.sorted() {
            
            if let clostes = clostest {
                let a = abs(specialDate.timeIntervalSince1970 - date.timeIntervalSince1970)
                let b = abs(clostes.timeIntervalSince1970 - date.timeIntervalSince1970)
                if a < b {
                    clostest = specialDate
                }
            } else {
                clostest = specialDate
            }
            
        }
        
        
        return clostest!
    }
    
    private func getYearDoomsday(centuryDoomsyear: Days, year: UInt) -> Days {
        
        let yearToAdd = Int(year) - (Int(year/100) * 100)
        let leapYearToAdd = Int(yearToAdd / 4)
        
        return getDayFromIndex(index: (getIndexFromDay(day: centuryDoomsyear) + yearToAdd + leapYearToAdd) % 7)
    }
    
    // Not really century but first year century
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
