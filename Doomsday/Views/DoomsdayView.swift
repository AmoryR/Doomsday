//
//  DoomsdayView.swift
//  Doomsday
//
//  Created by Amory Rouault on 05/02/2022.
//

import SwiftUI

enum DoomsdayNavigationView {
    case howTo, training, challenge
}

struct DoomsdayView: View {
    
    @State private var navigationSelection: DoomsdayNavigationView?
    
//    private let dayGuessService = DayGuessService()
//
//    @State private var randomDate: Date?
//    @State private var dayGuess = Day.monday
//    @State private var guessResult: DayGuessResult?
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
//                if let randomDate = self.randomDate {
//
//                    if let guessResult = self.guessResult {
//
//                        switch guessResult.result {
//                        case .success:
//                            Text("Congratulations!")
//                                .font(.title2)
//                                .padding(.horizontal)
//                            Text("\(randomDate.dateString()) is a \(guessResult.answer.rawValue).")
//                                .padding(.horizontal)
//                        case .fail:
//                            Text("Oops!")
//                                .font(.title2)
//                                .padding(.horizontal)
//                            Text("\(randomDate.dateString()) is actualy a \(guessResult.answer.rawValue).")
//                                .padding(.horizontal)
//                        }
//
//                        Button("Return") {
//                            self.reset()
//                        }
//                        .buttonStyle(PlainButtonStyle())
//                        .padding(.horizontal)
//                    } else {
//                        Text("Guess the day of : \(randomDate.dateString())")
//                            .padding(.horizontal)
//
//                        Picker("", selection: $dayGuess) {
//                            Text("Mon").tag(Day.monday)
//                            Text("Tue").tag(Day.tuesday)
//                            Text("Wed").tag(Day.wednesday)
//                            Text("Thu").tag(Day.thursday)
//                            Text("Fri").tag(Day.friday)
//                            Text("Sat").tag(Day.saturday)
//                            Text("Sun").tag(Day.sunday)
//                        }
//                        .pickerStyle(.segmented)
//                        .padding(.horizontal)
//
//                        Button("Guess") {
//                            self.guessResult = self.dayGuessService.guess(date: randomDate, day: self.dayGuess)
//                        }
//                        .buttonStyle(PlainButtonStyle())
//                        .padding(.horizontal)
//
//                        NavigationLink("How To?", destination: HowToView())
//                            .padding(.horizontal)
//                    }
//
//                    Spacer()
//                } else {
//
//                }
                
                // Navigation links
                NavigationLink(
                    destination: HowToView(),
                    tag: DoomsdayNavigationView.howTo,
                    selection: self.$navigationSelection
                ) { EmptyView() }
                
                NavigationLink(
                    destination: TrainingView(),
                    tag: DoomsdayNavigationView.training,
                    selection: self.$navigationSelection
                ) { EmptyView() }
                
                NavigationLink(
                    destination: ChallengeView(),
                    tag: DoomsdayNavigationView.challenge,
                    selection: self.$navigationSelection
                ) { EmptyView() }
                
                // Buttons
                Button("How To") {
                    self.navigationSelection = DoomsdayNavigationView.howTo
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal)
                
                Button("Training") {
                    self.navigationSelection = DoomsdayNavigationView.training
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal)
                
                Button("Challenge") {
                    self.navigationSelection = DoomsdayNavigationView.challenge
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal)
            }
            .navigationTitle("Doomsday")
        }
    }
    
//    private func reset() {
//        self.dayGuess = .monday
//        self.guessResult = nil
//        self.randomDate = nil
//    }
}

struct DoomsdayView_Previews: PreviewProvider {
    static var previews: some View {
        DoomsdayView()
    }
}

extension DoomsdayView {
    
}
