//
//  ChallengeView.swift
//  Doomsday
//
//  Created by Amory Rouault on 06/02/2022.
//

import SwiftUI

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

struct ChallengeView_Previews: PreviewProvider {
    static var previews: some View {
        ChallengeView(challenge: GuessChallenge())
    }
}
