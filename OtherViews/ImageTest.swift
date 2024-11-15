//
//  ImageTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 15.11.24.
//

import SwiftUI

struct ImageTest: View {
    @State var start = false
    
    var body: some View {
        List {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 100)
                .overlay {
                    // MARK: First image appears in original size resizable makes it pull out
                    Image("Cringe")
                        .resizable()
                }

            // MARK: With resizable can adjuct frame to resize
            Image("Cringe")
                .frame(width: 300, height: 100)

            Image("Cringe")
                .resizable()
                .frame(width: 300, height: 100)
                .padding()
                .background(Color.blue)

            Image("Cringe")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 100)
                .padding()
                .background(Color.blue)

            // Clipping can path a shape
            Image("Cringe")
                .resizable()
                .clipShape(Circle())
                .frame(width: 300, height: 300)

            // Symbols
            Group {
                // MARK: Multicoloring is a thing
                Image(systemName: "note.text.badge.plus")
                    .renderingMode(.original)
                    .font(.largeTitle)

                Image(systemName: "note.text.badge.plus")
                    .font(.largeTitle)

                // MARK: Variants
                Image(systemName: "lock.fill")
                    .font(.largeTitle)

                Image(systemName: "lock").symbolVariant(.slash.fill)
                    .font(.largeTitle)

                // MARK: Rendering
                Image(systemName: "gauge.badge.plus")
                    .symbolRenderingMode(.monochrome)
                    .font(.largeTitle)

                Image(systemName: "gauge.badge.plus")
                    .symbolRenderingMode(.hierarchical)
                    .font(.largeTitle)

                Image(systemName: "gauge.badge.plus")
                    .symbolRenderingMode(.multicolor)
                    .font(.largeTitle)

                // When you use foregroundStyle the rendering mode will change to pallete
                Image(systemName: "gauge.badge.plus")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.cyan, .cyan.opacity(0.5))
                    .font(.largeTitle)

                // MARK: Gradients
                Image(systemName: "bookmark.circle.fill")
                    .font(.system(size: 200))
                    .foregroundStyle(
                        LinearGradient(
                            colors: [.red, .blue], startPoint: .top,
                            endPoint: .bottom),
                        RadialGradient(
                            colors: [.green, .yellow], center: .center,
                            startRadius: 40, endRadius: 90)
                    )

                // MARK: Symbol effects
                Label {
                    Text("Variable color")
                } icon: {
                    Image(systemName: "airplayaudio")
                        .foregroundStyle(.teal)
                        .symbolEffect(.variableColor)
                        // Can be used for symbols that marked as variableColor
                }
                
                Label {
                    Text("Pulse in Exclamation")
                } icon: {
                    Image(systemName: "airplayaudio.badge.exclamationmark")
                        .foregroundStyle(.red, .teal)
                        .symbolEffect(.pulse)
                        // if badge present it would rather applied to it :)
                        
                }
                
                Label {
                    Text("Pulse")
                } icon: {
                    Image(systemName: "lightbulb.max.fill")
                        .foregroundStyle(.teal)
                        .symbolEffect(.bounce, options: .repeat(2), value: start)
                        // will bounce depending on value
                        
                }
                
                Button {
                    start.toggle()
                } label: {
                    Text("PRESS")
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}

#Preview {
    ImageTest()
}
