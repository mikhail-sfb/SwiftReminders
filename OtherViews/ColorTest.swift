//
//  ColorTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 14.11.24.
//

import SwiftUI

struct ColorTest: View {
    var body: some View {
        VStack {
            // Multiply colors
            Color.blue.colorMultiply(Color.yellow)
            Color(red: 0.3, green: 0.2, blue: 0.3, opacity: 0.5)
            Color.white.colorInvert()
            
            HStack {
                // In light mode the more is num the lighter and otherwised if we in dark
                Color(UIColor.systemGray)
                Color(UIColor.systemGray6)
            }
            
            // Swift also provide us with from the box gradients
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.red.gradient)
            
            HStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.test.gradient)
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.test)
            }
            
        }
        .padding()
    }
}

#Preview {
    ColorTest()
}
