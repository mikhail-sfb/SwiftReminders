//
//  PathTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 15.11.24.
//

import SwiftUI

// MARK: Path by itself is not a view and to become the view it should be modified
struct PathTest: View {
    var body: some View {
        VStack {
            Path { path in
                path.move(to: CGPoint(x: 10, y: 10))
                path.addLine(to: CGPoint(x: 200, y: 10))
            }
            .strokedPath(StrokeStyle(lineWidth: 5))
            .foregroundStyle(.red)
            
            MyDivider(lineWidth: 2)

            GeometryReader { geometry in
                Path { path in
                    let middle = geometry.frame(in: .local).midX
                    let width: CGFloat = 200
                    // Start in the center
                    path.move(to: CGPoint(x: middle, y: 10))
                    path.addLine(to: CGPoint(x: middle + width / 2, y: 170))
                    path.addLine(to: CGPoint(x: middle - width / 2, y: 170))
                    path.closeSubpath()
                }
                .strokedPath(StrokeStyle(lineWidth: 4))
            }
            
            GeometryReader { geometry in
                Path { path in
                    let middle = geometry.frame(in: .local).midX
                    let width = geometry.size.width / 2
                    // Start in the center
                    path.move(to: CGPoint(x: width, y: 0))
                    path.addLine(to: CGPoint(x: width / 2, y: -170))
                    path.addLine(to: CGPoint(x: 0, y: 0))
                    path.closeSubpath()
                }
                .fill(.pink)
            }
            
            CurvedShape()
                .fill(.purple)
                .padding()
            
            Text("Example of curved path but simple")
                .padding()
                .background {
                    RoundedBottomRectangle()
                        .fill(.pink)
                }
                .padding(.bottom, 100)
            
            DomeShape()
                .fill(.purple)
            
            // MARK: You can use an image as mask
            // someView().mask(Image("MyPath"))
        }
    }
}

// Relative arc

struct DomeShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.addRelativeArc(center: CGPoint(x: rect.midX, y: rect.maxY), radius: rect.midX, startAngle: .degrees(180), delta: .degrees(180))
        
        return path
    }
}

// Quad
struct RoundedBottomRectangle: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.maxX, y: 0))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addQuadCurve(to: CGPoint(x: 0, y: rect.maxY), control: CGPoint(x: rect.midX, y: rect.maxY + -10))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.closeSubpath()
        
        
        return path
    }
}

// Custom curved
struct CurvedShape: Shape {
    func path(in rect: CGRect) -> Path {
        let startPoint = CGPoint(x: rect.width * 0.65, y: 0)
        
        var path = Path()
        path.move(to: startPoint)
        path.addCurve(to: CGPoint(x: rect.width, y: rect.height / 2), control1: CGPoint(x: rect.width * 0.75, y: -50), control2: CGPoint(x: rect.width + 50, y: 0))
        
        return path
    }
}

// Custom divider
struct MyDivider: View {
    var lineWidth: CGFloat = 1
    var color: Color = .purple
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                path.move(to: CGPoint(x: 10, y: 10))
                path.addLine(to: CGPoint(x: geometry.size.width - 10, y: 10))
            }
            .strokedPath(StrokeStyle(lineWidth: lineWidth, lineCap: .round))
            .foregroundStyle(color)
        }
    }
}

#Preview {
    PathTest()
}
