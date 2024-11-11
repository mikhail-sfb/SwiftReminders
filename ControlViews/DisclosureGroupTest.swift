//
//  DisclosureGroupTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 6.11.24.
//

import SwiftUI

struct DisclosureGroupTest: View {
    @State var neseted: Bool = false
    @State var neseted1: Bool = false
    @State var neseted2: Bool = false


    var body: some View {
        VStack {
            DisclosureGroup("Hello") {
                Text("More info")
            }
            
            DisclosureGroup {
                Circle()
                    .fill(.blue)
            } label: {
                Text("More info")
            }
            .tint(.orange)
            .padding()
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(.orange)
                    .opacity(0.1)
            }
            
            DisclosureGroup("Hello", isExpanded: $neseted) {
                DisclosureGroup("Nested?", isExpanded: $neseted1) {
                    DisclosureGroup("Nested again?", isExpanded: $neseted2) {
                        Text("Hell nah")
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    DisclosureGroupTest()
}
