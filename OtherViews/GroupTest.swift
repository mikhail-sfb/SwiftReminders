//
//  GroupTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 15.11.24.
//

import SwiftUI

// Group groups content :) and apply modi not as one view as stacks, but individually
struct GroupTest: View {
    var body: some View {
        Group {
            Image(systemName: "person.crop.circle")
            Text("Hello, World!")
        }
        .padding()
        .background(Color.blue)
        .foregroundStyle(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        
        VStack {
            Image(systemName: "person.crop.circle")
            Text("Hello, World!")
        }
        .padding()
        .background(Color.blue)
        .foregroundStyle(.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    GroupTest()
}
