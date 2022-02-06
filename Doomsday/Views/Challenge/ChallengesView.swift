//
//  ChallengesView.swift
//  Doomsday
//
//  Created by Amory Rouault on 05/02/2022.
//

import SwiftUI

struct ChallengesView: View {
    
    @State private var rounds = 2
    
    @ObservedObject private var challenges = DayGuessChallenges()
    
    var body: some View {
        VStack {
            
            if self.challenges.challenges.count != 0 {
                
                if self.challenges.finished {
                    
                    ChallengesResultView(challenges: self.challenges)
                    
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

struct ChallengesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChallengesView()
        }
    }
}
