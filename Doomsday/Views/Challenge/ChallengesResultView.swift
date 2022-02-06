//
//  ChallengesResultView.swift
//  Doomsday
//
//  Created by Amory Rouault on 06/02/2022.
//

import SwiftUI

struct ChallengesResultView: View {
    let challenges: DayGuessChallenges
    
    var body: some View {
        List {
            ForEach(self.challenges.challenges) { challenge in
                HStack {
                    VStack(alignment: .leading) {
                        Text("\(challenge.date.dateString())")
                        Text("Is a \(challenge.result!.answer.rawValue.uppercased())")
                    }
                    Spacer()
                    switch challenge.result!.result {
                    case .success:
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                    case .fail:
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.red)
                    }
                }
            }
        }
    }
}

struct ChallengesResultView_Previews: PreviewProvider {
    static var previews: some View {
        let challenges = DayGuessChallenges()
        challenges.start(rounds: 2)
        
        challenges.next()
        challenges.next()
        
        return NavigationView {
            ChallengesResultView(challenges: challenges)
                .navigationTitle("Challenges")
        }
    }
}
