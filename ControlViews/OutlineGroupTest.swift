//
//  OutlineGroupTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 11.11.24.
//

import SwiftUI

struct Parent: Identifiable {
    var id = UUID()
    var name = ""
    var children: [Parent]? = nil
}

struct OutlineGroupTest: View {
    // Similar to list but does not scroll
    var parents = [
        Parent(id: .init(), name: "Parent 1"),
        Parent(id: .init(), name: "Parent 2"),
        Parent(id: .init(), name: "Parent 3"),
    ]

    var body: some View {
        OutlineGroup(parents, children: \.children) { parent in
            HStack {
                Image(systemName: "person.circle")
                Text(parent.name)
                Spacer()
            }
        }
        .padding()
        .tint(.red)
    }
}

#Preview {
    OutlineGroupTest()
}
