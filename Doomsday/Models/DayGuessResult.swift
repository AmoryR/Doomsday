//
//  DayGuessResult.swift
//  Doomsday
//
//  Created by Amory Rouault on 30/01/2022.
//

import Foundation

enum Result: String {
    case success = "success", fail = "fail"
}

struct DayGuessResult {
    var result: Result
    var answer: Day
    
    init(guess: Day, answer: Day) {
        self.answer = answer
        if answer.rawValue == guess.rawValue {
            self.result = .success
        } else {
            self.result = .fail
        }
    }
}
