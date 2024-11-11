//
//  PickerSegmentedControl.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 11.11.24.
//

import SwiftUI

struct PickerSegmentedControl: View {
    @State var dayPart = "day"
    @State var tab = 1
    
    var body: some View {
        VStack(spacing: 20) {
            Picker("", selection: $dayPart) {
                Text("Day").tag("day")
                
                Text("Night").tag("night")
            }
            .pickerStyle(.segmented)
            .padding()
            
            Picker("", selection: $tab) {
                Image(systemName: "sun.min").tag(0)
                
                Image(systemName: "moon").tag(1)
            }
            .pickerStyle(.segmented)
            .background(RoundedRectangle(cornerRadius: 8).stroke(Color.red, lineWidth: 2).fill(Color.red.opacity(0.2)))
            .padding()
        }
    }
}

#Preview {
    PickerSegmentedControl()
}
