//
//  CircularShapes.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 13.11.24.
//

import SwiftUI

// MARK: Circle capsule elipses
struct CircularShapes: View {
    @State var circleProgress: CGFloat = 1.0
    var cirleProgressPercent: Int {
        Int(circleProgress * 100)
    }
    
    var body: some View {
        VStack {
            // Styles
            Capsule(style: .continuous)
                .stroke(Color.purple, style: StrokeStyle(lineWidth: 10, dash: [10,2]))
            // 10 - length of the dash, 2 - length between em
                .frame(height: 100)
                .padding(.bottom, 40)
            
            
            // MARK: StrokeBorder grows from the outbound to center
            ZStack {
                Capsule()
                    .strokeBorder(Color.red, lineWidth: 30)
                
                Capsule()
                    .stroke()
            }
            .frame(height: 100)
            .padding()
            
            ZStack {
                Capsule()
                    .stroke(Color.red, lineWidth: 30)
                
                Capsule()
                    .stroke()
            }
            .frame(height: 100)
            .padding()
            
            // MARK: Size and frame
            Group {
                Circle()
                    .frame(width: 50, height: 50)
                    .padding()
                
                // not center
                Capsule()
                    .size(width: 50, height: 50)
                    .padding()
            }
            
            Circle()
                .trim(from: 0, to: circleProgress)
                .stroke(.pink, style: StrokeStyle(lineWidth: 10, lineCap: .round))
                .rotationEffect(.degrees(270))
                .overlay {
                    Text(cirleProgressPercent, format: .percent)
                }
            
            Circle()
                .trim(from: 0, to: 0.5)
                .rotation(.degrees(45))
            
            Slider(value: $circleProgress, in: 0...1)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    CircularShapes()
}
