//
//  DayGuessChallenge.swift
//  Doomsday
//
//  Created by Amory Rouault on 06/02/2022.
//

import Foundation

class GuessChallenge: ObservableObject, Identifiable {
    let id = UUID()
    let date: Date
    @Published var guess: Day = .monday
    var result: DayGuessResult?
    
    // Time
    
    init() {
        self.date = Date.randomBetween(start: "1500-01-01", end: "2500-01-01")
    }
    
    func valid() {
        let dayGuess = DayGuessService()
        self.result = dayGuess.guess(date: self.date, day: self.guess)
    }
}
