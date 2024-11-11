//
//  SliderTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 11.11.24.
//

import SwiftUI
//  When using a Slider view, the default range of values is 0.0 to 1.0. You bind the Slider to a state variable, usually a number type, like an Int. But it doesn’t have to be a number type. It can be any type that conforms to the Stridable protocol. (“Stride” means to “take steps in a direction; usually long steps”.) A type that conforms to Stridable (such as an Int) means it has values that are continuous and can be stepped through and measured. (“Step through”, “Stride”, I think you see the connection now.)

struct SliderTest: View {
    @State var sliderValue: Double = 5
    let ageFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .spellOut
        return formatter
    }()
    
    var body: some View {
        // Step defines increment to next value
        Slider(value: $sliderValue, in: 0...100, step: 1, minimumValueLabel: Image(systemName: "tortoise"), maximumValueLabel: Image(systemName: "hare"), label: {
            Text("Label")
        })
            .tint(.pink)
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).stroke(Color.pink, lineWidth: 2).fill(Color.pink).opacity(0.2))
            .padding(.horizontal)
        
        Text("Current value is: ") + Text(String(sliderValue)).foregroundStyle(.orange)
        
        Text("Current age is: ") + Text("\(ageFormatter.string(from: NSNumber(value: sliderValue))!)").foregroundStyle(.orange)
    }
}

#Preview {
    SliderTest()
}
