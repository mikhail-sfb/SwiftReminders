//
//  DividerTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 14.11.24.
//

import SwiftUI

struct DividerTest: View {
    var body: some View {
        // MARK: Thickness changing is restricted, but you can color the divider
        Text("They ar stupid af, vstack? - horizontal : vertical!")
        
        VStack {
            Text("In vstack in vstack")
            
            Divider()
            
            Text("In vstack in vstack")
        }
        
        HStack {
            Text("In hstack in hstack")
            
            Divider()
                .background(.green)
            
            Text("In hstack in hstack")
        }
    }
}

#Preview {
    DividerTest()
}
