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
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                
                
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
                    destination: ChallengesView(),
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
   
}

struct DoomsdayView_Previews: PreviewProvider {
    static var previews: some View {
        DoomsdayView()
    }
}

extension DoomsdayView {
    
}
