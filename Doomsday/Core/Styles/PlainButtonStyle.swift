//
//  PlainButtonStyle.swift
//  Doomsday
//
//  Created by Amory Rouault on 05/02/2022.
//

import SwiftUI

struct PlainButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        PlainButton(configuration: configuration)
    }
    
    struct PlainButton: View {
        let configuration: ButtonStyle.Configuration
        @Environment(\.isEnabled) private var isEnabled: Bool
        
        var body: some View {
            configuration.label
                .padding()
                .frame(maxWidth: .infinity)
                .background(isEnabled ? Color.init(uiColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)) : .white)
                .foregroundColor(isEnabled ? .accentColor : .gray)
                .cornerRadius(8)
        }
    }
}
