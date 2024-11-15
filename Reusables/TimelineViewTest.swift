//
//  TimelineViewTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 13.11.24.
//

import SwiftUI

// MARK: View that updates body according to a provided schedule
struct TimelineViewTest: View {
    var body: some View {
        TimelineView(.animation) { context in
            // context also has cadence (ритм)
            let value = secondsValue(for: context.date)
            
            Circle()
                .trim(from: 0, to: value)
        }
        
        TimelineView(.periodic(from: .now.addingTimeInterval(2), by: 1)) { context in
            // context also has cadence (ритм)
            let value = secondsValue(for: context.date)
            
            Text(value, format: .number)
                .font(.largeTitle.bold())
        }
    }
    
    private func secondsValue(for date: Date) -> Double {
        let seconds = Calendar.current.component(.second, from: date)
        return Double(seconds) / 60
    }
}

#Preview {
    TimelineViewTest()
}
