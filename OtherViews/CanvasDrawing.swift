//
//  CanvasDrawing.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 13.11.24.
//

import SwiftUI

// MARK: With context we draw
struct CanvasDrawing: View {
    var body: some View {
        Canvas { context, size in
            context.stroke(
                Path(
                    ellipseIn: CGRect(
                        origin: CGPoint(x: 4, y: 4),
                        size: CGSize(
                            width: size.width - 64, height: size.height - 128))),
                with: .color(.red), lineWidth: 7)
            
            let image = Image(systemName: "scribble.variable")
            context.draw(image, at: CGPoint(x: size.width / 2 - 22, y: size.height / 2 - 22))
        }
    }
}

#Preview {
    CanvasDrawing()
}
