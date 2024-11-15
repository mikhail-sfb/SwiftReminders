//
//  RectangularShapesTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 15.11.24.
//

import SwiftUI

// Deco individual corners
struct RectangularShapesTest: View {
    var body: some View {
        HStack {
            UnevenRoundedRectangle(topLeadingRadius: 50, bottomTrailingRadius: 180)
                .fill(.green.gradient)
                .frame(width: 120, height: 200)
            
            UnevenRoundedRectangle(topLeadingRadius: 50, bottomTrailingRadius: 180)
                 .fill(.cyan.gradient)
                 .frame(width: 120, height: 200)
                 .rotationEffect(.degrees(180))
        }
        .padding()
        .background(Color(UIColor.systemGray) , in: RoundedRectangle(cornerRadius: 20))
        
    }
}

#Preview {
    RectangularShapesTest()
}
