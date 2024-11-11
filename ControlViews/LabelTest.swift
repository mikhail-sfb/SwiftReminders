//
//  LabelTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 7.11.24.
//

import SwiftUI

struct LabelTest: View {
    var body: some View {
        VStack {
            // MARK: Label
            Label("Hello, World!", systemImage: "person")
                .listItemTint(.red)
            // it will align icons with text, works with images too
            
            List {
                Label("Hello, World!", systemImage: "person")
                    .listItemTint(.red)
                Label("Hello, World!", systemImage: "person")
                    .listItemTint(.green)
                Label("Hello, World!", systemImage: "person")
                    .listItemTint(.monochrome)
                    .labelStyle(.iconOnly) // Cool thing
                Label("Hello, World!", systemImage: "person")
            }
            
            
            Label {
                Text("Can style how i want")
                    .foregroundStyle(.purple)
            } icon: {
                Image(systemName: "person")
                    .foregroundStyle(.red)
            }
            
            // MARK: LabeledContent
            
            LabeledContent("Hello, World!", value: "person")
            
            LabeledContent("Hello, World!", value: 55, format: .percent)
            
            LabeledContent("Hello, World!") {
                Label("person", systemImage: "person")
            }
            
            LabeledContent {
                Text(55.formatted(.percent))
            } label: {
                Text("Person")
                    .badge(55)
                    .bold()
            }
            .padding()
            .background(Color.blue.opacity(0.1), in: RoundedRectangle(cornerRadius: 20))
            
            // WTF IS BADGE
            
            Spacer()
        }
        .padding()
        
    }
}

#Preview {
    LabelTest()
}
