//
//  MultiDatePickerTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 10.11.24.
//

import SwiftUI

struct MultiDatePickerTest: View {
    @State var dates: Set<DateComponents> = []
    // MARK: Important restrictions
    var range = Date() ..< Calendar.current.date(byAdding: .day, value: 10, to: Date())!
    
    var body: some View {
        VStack {
            MultiDatePicker("Date ranges", selection: $dates, in: range)
                .tint(.green)
            
            List {
                Section("Selected ones") {
                    ForEach(Array(dates), id: \.self) { date in
                        Text("\(date.day!) \(date.month!) \(date.year!)")
                    }
                }
            }
        }
        
    }
}

#Preview {
    MultiDatePickerTest()
}
