//
//  GuessResult.swift
//  Doomsday
//
//  Created by Amory Rouault on 30/01/2022.
//

import Foundation

enum Result {
    case success, fail
}

struct GuessResult {
    var result: Result
    var answer: Days
    
    init(guess: Days, answer: Days) {
        self.answer = answer
        if answer.rawValue == guess.rawValue {
            self.result = .success
        } else {
            self.result = .fail
        }
    }
}
