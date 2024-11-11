//
//  StepperTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 11.11.24.
//

import SwiftUI
//  When using a Stepper view, you bind it to a state variable, usually a number. But it doesn’t have to be a number type. It can be any type that conforms to the Stridable protocol. (“Stride” means to “take steps in a direction; usually long steps”.) A type that conforms to Stridable means it has values that are continuous and can be stepped through and measured. (“Step through”, “Stride”, I think you see the connection now.)

struct StepperTest: View {
    @State var stepperValue = 1
    @State var stepperValue2 = 1.0
    @State var values = [0, 1]
    
    var body: some View {
        VStack {
            Text("Notice the minus and plus buttons can not be affected. The platforms determine how this will be shown.")
                .bold()
                .padding()
                .background(Color.blue, in: RoundedRectangle(cornerRadius: 10))
                .foregroundStyle(.white)
            
            // Bound to vars
            // if we spec IN, stepper could not go outside borders
            Stepper(value: $stepperValue, in: 0...100) {
                Text("Bound stepper: \(stepperValue)")
            }

            // Run code on inc/dec
            Stepper {
                values.append(values.count)
            } onDecrement: {
                values.removeLast()
            } label: {
                Text("Action!")
            }
            // MARK: .labelsHidden() - hides label and its not pushes horizontaly
            
            // MARK: Custom stepper color changer
            HStack {
                Text("Step step step!")
                Spacer()
                Stepper(value: $stepperValue, in: 1...100, step: Int.Stride(0.2)){}
                    .labelsHidden()
                    .background(Color.teal, in: RoundedRectangle(cornerRadius: 8))
            }
            
            HStack {
                ForEach(values, id: \.self) { value in
                    Image(systemName: "\(value).circle.fill")
                }
                .font(.title)
                .foregroundStyle(.green)
            }

        }
        .padding()
    }
}

#Preview {
    StepperTest()
}
