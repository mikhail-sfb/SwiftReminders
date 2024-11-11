//
//  ColorDatePicker.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 4.11.24.
//

import SwiftUI

struct ColorDatePicker: View {
    @State var color: Color = .red
    @State var date = Date()
    
    var body: some View {
        VStack {
            Text("Hello: \(date)")
                .padding()
                .frame(width: 300, height: 100)
                .background(.red)
                .foregroundStyle(.white)
            
            ColorPicker("Color picker", selection: $color, supportsOpacity: true)
            
            // In form it uses compact
            DatePicker("Date picker", selection: $date, displayedComponents: [.hourAndMinute, .date])
              // .datePickerStyle(.graphical)
              //  .labelsHidden()
        }
        .padding()
    }
}

#Preview {
    ColorDatePicker()
}
