//
//  Step2DetailView.swift
//  Doomsday
//
//  Created by Amory Rouault on 05/02/2022.
//

import SwiftUI

struct Step2DetailView: View {
    var body: some View {

        ScrollView {
            VStack(alignment: .leading) {
                
                Text("Find the clostest special date from the date.")
                Text("All special days share the same doomsday.")
                    .padding(.bottom)
                
                Group {
                    Text("Special days list")
                        .font(.title2)
                    
                    Text("Even dates")
                        .font(.subheadline)
                    Group {
                        HStack {
                            Text("04/04")
                            Spacer()
                            Text("April 4th")
                        }
                        HStack {
                            Text("06/06")
                            Spacer()
                            Text("June 6th")
                        }
                        HStack {
                            Text("08/08")
                            Spacer()
                            Text("August 8th")
                        }
                        HStack {
                            Text("10/10")
                            Spacer()
                            Text("October 10th")
                        }
                        HStack {
                            Text("12/12")
                            Spacer()
                            Text("December 12th")
                        }
                    }
                    
                    Text("Symetric dates")
                        .font(.subheadline)
                    Group {
                        HStack {
                            Text("9/5")
                            Spacer()
                            Text("September 5th")
                        }
                        HStack {
                            Text("5/9")
                            Spacer()
                            Text("May 9th")
                        }
                        HStack {
                            Text("7/11")
                            Spacer()
                            Text("July 11th")
                        }
                        HStack {
                            Text("11/7")
                            Spacer()
                            Text("November 7th")
                        }
                    }
                    
                    Text("Event dates")
                        .font(.subheadline)
                    Group {
                        HStack {
                            Text("3/14")
                            Spacer()
                            Text("PI day")
                        }
                        HStack {
                            Text("7/4")
                            Spacer()
                            Text("Independence")
                        }
                        HStack {
                            Text("10/31")
                            Spacer()
                            Text("Halloween")
                        }
                        HStack {
                            Text("12/26")
                            Spacer()
                            Text("Boxing day")
                        }
                        .padding(.bottom)
                    }
                }
                
                Group {
                    Text("Example")
                        .font(.title2)
                    
                    Text("April 17th clostest special date is April 4th.")
                    Text("Chrismas clostest special date is Boxing day.")
                }
                
                Spacer()
                    .frame(maxWidth: .infinity)
            }
            .padding(.horizontal)
        }
        .navigationTitle("Step 2")
    }
}

struct Step2DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            Step2DetailView()
        }
    }
}
