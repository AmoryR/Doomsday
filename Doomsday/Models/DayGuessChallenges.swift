//
//  DayGuessChallenges.swift
//  Doomsday
//
//  Created by Amory Rouault on 06/02/2022.
//

import Foundation

class DayGuessChallenges: ObservableObject {
    
    @Published var challenges = [GuessChallenge]()
    @Published var currentIndex = 0
    @Published var finished = false
    
    var current: GuessChallenge {
        get {
            return self.challenges[self.currentIndex]
        }
    }
    
    init() {}
    
    func start(rounds: Int) {
        // Generate challenges
        for _ in 0..<rounds {
            self.challenges.append(GuessChallenge())
        }
    }
    
    func reset() {
        self.finished = false
        self.currentIndex = 0
        self.challenges = []
    }
    
    func currentChallenge() -> GuessChallenge {
        return self.challenges[self.currentIndex]
    }
    
    func next() {
        if let _ = self.current.result {} else {
            self.current.valid()
        }
        
        if self.currentIndex < self.challenges.count - 1 {
            self.currentIndex += 1;
        } else {
            self.finished = true
        }
    }
    
}
