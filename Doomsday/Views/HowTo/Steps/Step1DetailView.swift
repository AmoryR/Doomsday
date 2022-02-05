//
//  Step1DetailView.swift
//  Doomsday
//
//  Created by Amory Rouault on 05/02/2022.
//

import SwiftUI

struct Step1DetailView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Group {
                    Text("Find the doomsday for the year.")
                    Text("Doomsday is the day that all special dates share.")
                    Text("You'll learn about special dates in Step2")
                        .padding(.bottom)
                }
                
                Group {
                    Text("Doomsday to remember")
                        .font(.title2)
                    
                    HStack {
                        Text("2300")
                        Spacer()
                        Text("Wednesday")
                    }
                    HStack {
                        Text("2200")
                        Spacer()
                        Text("Friday")
                    }
                    HStack {
                        Text("2100")
                        Spacer()
                        Text("Sunday")
                    }
                    HStack {
                        Text("2000")
                        Spacer()
                        Text("Tuesday")
                    }
                    .padding(.bottom)
                }
                
                Text("This scheme repeats as you go up or down in the centuries.")
                    .padding(.bottom)
                
                NavigationLink("Day index", destination: EmptyView())
                    .padding(.bottom)
                
                Group {
                    Text("Find year doomsday")
                        .font(.title2)
                    
                    Text("Get first century year doomsday from table above.")
                    Text("Add the number of years in the century to the doomsday index.")
                    Text("Add leap year to that number.")
                    Text("Leap year is computed by divides the number of years in the century by 4.")
                    Text("Take the rest of the division of this number by 7.")
                    Text("The year doomsday is the day associated to this number.")
                        .padding(.bottom)
                    
                }
                
                Group {
                    Text("Examples")
                        .font(.title2)
                    
                    Text("Year 1958.")
                    Text("Doomsday of year 1900 is a Wednesday.")
                    Text("Wednesday index is 3.")
                    Text("58 + 3 = 61.")
                    Text("Add leap years : 61 + (58 / 4) = 61 + 14 = 75.")
                    Text("75 / 7 = 7 * 10 + 5 so the rest is 5.")
                    Text("The day associated to index 5 is a Friday.")
                    Text("Doomsday of year 1958 is a Friday.")
                        .padding(.bottom)
                }
                
                Text("Depending on the date, it can be very difficult.")
                Text("In the special tricks, you can learn how to easily find the doomsday of the year.")
                
                Spacer()
                    .frame(maxWidth: .infinity)
            }
            .padding(.horizontal)
        }
        .navigationTitle("Step 1")
    }
}

struct Step1DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Step1DetailView()
        }
    }
}
