//
//  GaugeIntro.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 7.11.24.
//

import SwiftUI

struct GaugeTest: View {
    // MARK: 0.0-1.0
    @State var progress = 0.25
    let gradient = Gradient(colors: [.blue, .yellow, .orange, .red])
    
    var body: some View {
        VStack {
            Gauge(value: progress) {
                Text("Default in IOS")
            }
            .tint(gradient) // does not affect labels
            
            Gauge(value: progress) {
                Text("Default in IOS")
            }
            .gaugeStyle(.linearCapacity) // default one
            .tint(.purple)
            
            Gauge(value: progress) {
                Text("Default in IOS") // accessoryLinear - does not show label
            }
            .gaugeStyle(.accessoryLinear)
            .tint(.orange)
            .padding(.top)
            
            Gauge(value: progress) {
                Text("Default in IOS")
            } currentValueLabel: {
                Text(progress, format: .number)  // number under gauge
            } minimumValueLabel: {
                Text(1, format: .number)
            } maximumValueLabel: {
                Text(100, format: .number)
            }
            
            .gaugeStyle(.accessoryLinearCapacity)
            .tint(.purple)
            
            Gauge(value: progress) {
                
            }
            .gaugeStyle(.accessoryCircularCapacity) // default one
            .tint(.cyan)
            .padding(.bottom, 100)
                        
            Gauge(value: progress) {
                // MARK: Text("hei")
            }
            .scaleEffect(4) // increasing the size of Gauge but in cost of blured text, so
            .frame(width: 250, height: 250)
            .gaugeStyle(.accessoryCircular) // default one
            .tint(.indigo)
            .overlay(alignment: .bottom) {
                Text("level")
                    .font(.largeTitle)
            }
        }
        .padding()
    }
}

#Preview {
    GaugeTest()
}
