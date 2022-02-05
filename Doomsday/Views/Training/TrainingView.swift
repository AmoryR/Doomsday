//
//  TrainingView.swift
//  Doomsday
//
//  Created by Amory Rouault on 05/02/2022.
//

import SwiftUI

struct TrainingView: View {
    
    private let dayGuessService = DayGuessService()
    
    @State private var randomDate = Date.parse("2020-01-01")
    @State private var dayGuess = Day.monday
    @State private var guessResult: DayGuessResult?
    
    init() {
        self.newRandomDate()
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            if let guessResult = self.guessResult {

                switch guessResult.result {
                case .success:
                    Text("Congratulations!")
                        .font(.title2)
                        .padding(.horizontal)
                    Text("\(randomDate.dateString()) is a \(guessResult.answer.rawValue).")
                        .padding(.horizontal)
                case .fail:
                    Text("Oops!")
                        .font(.title2)
                        .padding(.horizontal)
                    Text("\(randomDate.dateString()) is actualy a \(guessResult.answer.rawValue).")
                        .padding(.horizontal)
                }

                Button("Retry") {
                    self.dayGuess = .monday
                    self.guessResult = nil
                    self.newRandomDate()
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal)
                
                Text("How to find detail is coming...")
                
            } else {
                
                Text("Guess the day of : \(randomDate.dateString())")
                    .padding(.horizontal)

                Picker("", selection: $dayGuess) {
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

                Button("Guess") {
                    self.guessResult = self.dayGuessService.guess(date: randomDate, day: self.dayGuess)
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.horizontal)
                
            }
            
            Spacer()
            
        }
        .navigationTitle("Training")
        .onAppear {
            self.newRandomDate()
        }
        
        
        
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
    }
    
    func newRandomDate() {
        self.randomDate = self.dayGuessService.generateRandomDate()
    }
    
}

struct TrainingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            TrainingView()
        }
    }
}
