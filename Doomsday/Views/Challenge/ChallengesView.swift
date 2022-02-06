//
//  ChallengesView.swift
//  Doomsday
//
//  Created by Amory Rouault on 05/02/2022.
//

import SwiftUI

class GuessChallenge: ObservableObject {
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

class GuessChallenges: ObservableObject {
    
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

struct ChallengeView: View {
    
    @ObservedObject var challenge: GuessChallenge
    
    var body: some View {
        VStack {
            Text("Guess the day of : \(self.challenge.date.dateString())")
                .padding(.horizontal)
            
            Picker("", selection: self.$challenge.guess) {
                Text("Mon").tag(Day.monday)
                Text("Tue").tag(Day.tuesday)
                Text("Wed").tag(Day.wednesday)
                Text("Thu").tag(Day.thursday)
                Text("Fri").tag(Day.friday)
                Text("Sat").tag(Day.saturday)
                Text("Sun").tag(Day.sunday)
            }
            .pickerStyle(.segmented)
            .padding(.horizontal)
            
            Spacer()
        }
    }
    
}

struct ChallengesView: View {
    
    @State private var rounds = 5
    
    @ObservedObject private var challenges = GuessChallenges()
    
    var body: some View {
        VStack {
            
            if self.challenges.challenges.count != 0 {
                
                if self.challenges.finished {
                    
                    Text("Finished")
                    Text("Show result ...")
                    
                    Button("Retry") {
                        self.challenges.reset()
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.horizontal)
                    
                } else {

                    ChallengeView(challenge: challenges.current)
                    
                    // Valid button
                    Button("Next") {
                        challenges.next()
                    }
                    .buttonStyle(PlainButtonStyle())
                    .padding(.horizontal)
                    
                }
                
            } else {
                Stepper("Rounds: \(self.rounds)", value: self.$rounds, in: (1...10))
                    .padding(.horizontal)
                
                Button("Start") {
                    self.challenges.start(rounds: self.rounds)
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal)
            }
            
            
            Spacer()
        }
        .navigationTitle("Challenge")
    }
}

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChallengesView()
        }
    }
}
