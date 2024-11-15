//
//  Inet.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 15.11.24.
//

import SwiftUI

// MARK: Applies on shapes only!
// inset allows to add padding between the edge of the frame and the shape itself
struct InsetTest: View {
    var body: some View {
        Circle()
            .inset(by: 10)
            .fill(.pink)
            .frame(width: 200)
            .border(Color.pink)
    }
}

#Preview {
    InsetTest()
}
