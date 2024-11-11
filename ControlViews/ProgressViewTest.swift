//
//  ProgressViewTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 11.11.24.
//

import SwiftUI

struct ProgressViewTest: View {
    @State var progress = 0.75
    
    var body: some View {
        ProgressView()
        
        ProgressView("Loading...")
            .tint(.pink)
            .font(Font.system(.largeTitle, design: .monospaced).bold())
        
        ProgressView(value: progress)
            .padding()
            .tint(.pink)
        
        // MARK: total we have
        ProgressView("Here comes the progress" , value: progress, total: progress * 3)
            .padding(.horizontal)
            .tint(.pink)
        
        ProgressView(value: progress, total: progress * 3, label: {
            Text("Here comes the progress")
                .foregroundStyle(.red)
        }, currentValueLabel: {
            Text("Hiiiiiiiiiii")
        }
        )
        .padding(.horizontal)
        .tint(.yellow)
    }
}

#Preview {
    ProgressViewTest()
}
