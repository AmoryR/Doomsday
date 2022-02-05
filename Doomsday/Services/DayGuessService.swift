//
//  DayGuessService.swift
//  Doomsday
//
//  Created by Amory Rouault on 30/01/2022.
//

import Foundation

class DayGuessService {
    
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
        self.specialDates = []
    }
    
    func generateRandomDate() -> Date {
        return Date.randomBetween(start: "1900-01-01", end: "2100-01-01")
    }
    
    private func setSpecialsDates(year: UInt) {
        
//        if self.specialDatesString.count != 13 {
//            return
//        }
//        
//        if self.isLeap(year: year) {
//            self.specialDatesString.append("1-4")
//            self.specialDatesString.append("2-29")
//        } else {
//            self.specialDatesString.append("1-3")
//            self.specialDatesString.append("2-28")
//        }
        
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
    
    func guess(date: Date, day: Day) -> DayGuessResult {
        self.specialDates = []
        
        let components = self.calendar.dateComponents([.year], from: date)
        self.setSpecialsDates(year: UInt(components.year!))
        
        // 1. Determine Doomsday day for date.getFullYear()
        let centuryDoomsday = self.getDoomsdayForCenturyOf(year: UInt(components.year!))
        
        // TODO: Get yearDoomsday from centuryDoomsday
        let yearDoomsday = self.getYearDoomsday(centuryDoomsyear: centuryDoomsday, year: UInt(components.year!))
        let doomsdayDayIndex = Day.getIndexFrom(day: yearDoomsday)
        
        // 2. Get clostest special date from date and make the difference
        let clostest = self.getClostestSpecialDateOf(date: date)
        
        // 3. Add difference to Doomsday day
        if let difference = self.calendar.dateComponents([.day], from: calendar.startOfDay(for: clostest), to: calendar.startOfDay(for: date)).day {
            let resultDay: Day = Day.getDayFrom(index: self.mod(a: doomsdayDayIndex + difference, b: 7))
            let gues = DayGuessResult(guess: day, answer: resultDay)
            return gues
            
        }
        
        return DayGuessResult(guess: .sunday, answer: .tuesday)
        
        // Tell that is because there is an error
//        return GuessResult(result: .fail, answer: .monday)
    }
    
    // https://torstencurdt.com/tech/posts/modulo-of-negative-numbers/
    private func mod(a: Int, b: Int) -> Int {
        let c = a % b;
        return c < 0 ? c + b : c
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
    
    private func getYearDoomsday(centuryDoomsyear: Day, year: UInt) -> Day {
        
        let yearToAdd = Int(year) - (Int(year/100) * 100)
        let leapYearToAdd = Int(yearToAdd / 4)
        
        return Day.getDayFrom(index: (Day.getIndexFrom(day: centuryDoomsyear) + yearToAdd + leapYearToAdd) % 7)
    }
    
    // Not really century but first year century
    private func getDoomsdayForCenturyOf(year: UInt) -> Day {
        
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
