//
//  ContentView.swift
//  Doomsday
//
//  Created by Amory Rouault on 30/01/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var randomDate: Date?
    @State private var dayGuess = Days.monday
    @State private var guessResult: GuessResult?
    
    private var dateGuess = DateGuess()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                if let randomDate = randomDate {
                    
                    Text(randomDate.dateString())
                    
                    Picker("", selection: $dayGuess) {
                        Text("Mon").tag(Days.monday)
                        Text("Tue").tag(Days.tuesday)
                        Text("Wed").tag(Days.wednesday)
                        Text("Thu").tag(Days.thursday)
                        Text("Fri").tag(Days.friday)
                        Text("Sat").tag(Days.saturday)
                        Text("Sun").tag(Days.sunday)
                    }
                    .pickerStyle(.segmented)
                    
                    if let guessResult = guessResult {
                        switch guessResult {
                        case .success:
                            Text("Success")
                        case .fail:
                            Text("Fail")
                        }
                        
                        Button("Retry") {
                            self.retry()
                        }
                    } else {
                        Button("Guess") {
                            guessResult = self.dateGuess.guess(date: randomDate, day: dayGuess)
                        }
                    }
                    
                } else {
                    Button("Generate") {
                        self.generate()
                    }
                }
                
                Spacer()
            }
            .padding(.horizontal)
            .navigationTitle("Doomsday")
        }
    }

    private func generate() {
        self.randomDate = Date.randomBetween(start: "1500-01-01", end: "2500-01-01")
    }
    
    private func retry() {
        self.guessResult = nil
        self.dayGuess = .monday
        self.generate()
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
