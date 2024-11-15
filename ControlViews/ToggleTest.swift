//
//  ToogleTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 13.11.24.
//

import SwiftUI

struct ToggleTest: View {
    @State var isOn: Bool = false
    
    var body: some View {
        VStack {
            Toggle("On this thing", isOn: $isOn)
                .tint(.blue)
            
            Toggle(isOn: $isOn) {
                HStack {
                    Text("On this thing")
                    
                    Image(systemName: isOn ? "checkmark.circle.fill" : "circle")
                }
            }
            .toggleStyle(SwitchToggleStyle(tint: .red))
            
            Toggle(isOn: $isOn) {
                Image(systemName: "heart")
                    .symbolVariant(isOn ? .fill : .none)
            }
            .toggleStyle(.button)
        }
        .padding()
    

    }
}

#Preview {
    ToggleTest()
}
