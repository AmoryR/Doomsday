//
//  Step3DetailView.swift
//  Doomsday
//
//  Created by Amory Rouault on 05/02/2022.
//

import SwiftUI

struct Step3DetailView: View {
    var body: some View {

        ScrollView {
            VStack(alignment: .leading) {
                
                Text("Compute the day difference with the special date.")
                    .padding(.bottom)
                
                Group {
                    Text("Example")
                        .font(.title2)
                    
                    Text("April 17th clostest special date is April 4th.")
                    Text("17 - 4 = 13")
                    Text("There is a difference of 13 days.")
                }
                
                Spacer()
                    .frame(maxWidth: .infinity)
            }
            .padding(.horizontal)
        }
        .navigationTitle("Step 3")
    }
}

struct Step3DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Step3DetailView()
        }
    }
}
