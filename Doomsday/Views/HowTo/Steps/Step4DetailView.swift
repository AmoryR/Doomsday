//
//  Step4DetailView.swift
//  Doomsday
//
//  Created by Amory Rouault on 05/02/2022.
//

import SwiftUI

struct Step4DetailView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                Text("Add/Substract the difference to the doomsday.")
                    .padding(.bottom)
                
                Text("Take the doomsday index.")
                Text("Add the difference is the special day is before the date.")
                Text("Substract the difference is the special day is adter the date.")
                Text("Compute the rest of the division of the result by 7.")
                Text("It gives you a number between 0 and 6. It is the index of the day.")
                    .padding(.bottom)
                
                Group {
                    Text("Example")
                        .font(.title2)
                    
                    Group {
                        Text("Find the day of 1958 April 17th.")
                        Text("From Step 1: Doomsday of year 1958 is a Friday.")
                            .padding(.bottom)
                        Text("From Step 2: Clostest special date is April 4th")
                        Text("Now we know 1958 April 4th is a Friday!")
                            .padding(.bottom)
                        
                        Text("From Step 3: There is 13 days between those dates.")
                            .padding(.bottom)
                        
                        Text("The index of Friday is 5.")
                        Text("5 + 13 is 18")
                        Text("The rest of 18 / 7 is 4.")
                        Text("Day of index 4 is Thursday.")
                            .padding(.bottom)
                        
                        Text("1958 April 17th is a Thursday!")
                    }
                    
                }
                
                Spacer()
                    .frame(maxWidth: .infinity)
            }
            .padding(.horizontal)
        }
        .navigationTitle("Step 4")
    }
}

struct Step4DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Step4DetailView()
        }
    }
}
