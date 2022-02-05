//
//  HowToView.swift
//  Doomsday
//
//  Created by Amory Rouault on 05/02/2022.
//

import SwiftUI

struct HowToView: View {
    var body: some View {
        VStack(alignment: .leading) {
            NavigationLink(destination: Step1DetailView()) {
                Text("Step 1")
                    .font(.title2)
            }
            Text("Find the doomsday for the year.")
                .padding(.bottom)
            
            NavigationLink(destination: Step2DetailView()) {
                Text("Step 2")
                    .font(.title2)
            }
            Text("Find the clostest special date from the date.")
                .padding(.bottom)
            
            NavigationLink(destination: Step3DetailView()) {
                Text("Step 3")
                    .font(.title2)
            }
            Text("Compute the day difference with the special date.")
                .padding(.bottom)
            
            NavigationLink(destination: Step4DetailView()) {
                Text("Step 4")
                    .font(.title2)
            }
            Text("Add/Substract the difference to the doomsday.")
                .padding(.bottom)
            
            // TIPS LIST :
            // - Rest of the division with a negative number
            // - Shortcuts for years
            
            Spacer()
                .frame(maxWidth: .infinity)
        }
        .padding(.horizontal)
        .navigationTitle("How To")
    }
}

struct HowToView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HowToView()
        }
    }
}
