//
//  ScrollViewTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 11.11.24.
//

import SwiftUI

// MARK: A Scrollview with a ForEach view is similar to a List. But be warned, the rows are not reusable.
struct ScrollViewTest: View {
    @State var names = [
        "SwiftUI", "SwiftUI Book", "SwiftUI Book 2", "SwiftUI Book 3",
        "SwiftUI Book 4", "SwiftUI Book 5", "SwiftUI Book 6", "SwiftUI Book 7",
        "SwiftUI Book 8", "SwiftUI Book 9", "SwiftUI Book 10",
        "SwiftUI Book 11", "SwiftUI Book 12", "SwiftUI Book 13",
        "SwiftUI Book 14", "SwiftUI Book 15", "SwiftUI Book 16",
        "SwiftUI Book 17", "SwiftUI Book 18", "SwiftUI Book 19",
        "SwiftUI Book 20", "SwiftUI Book 21", "SwiftUI Book 22",
        "SwiftUI Book 23", "SwiftUI Book 24", "SwiftUI Book 25",
        "SwiftUI Book 26"
    ]
    
    var body: some View {
        ScrollView {
            ForEach(names, id: \.self) { name in
                HStack {
                    Text(name).foregroundStyle(.primary)
                    Image(systemName: "checkmark.seal.fill")
                        .foregroundStyle(.green)
                    Spacer()
                }
                .padding()
                .background(
                    Color.white.shadow(.drop(radius: 1, y: 1)),
                    in: RoundedRectangle(cornerRadius: 8)
                )
                .padding(.bottom, 4)
            }
            .padding(.horizontal)
        }
        .safeAreaInset(edge: .bottom) {
            VStack(spacing: 20) {
                Divider()
                Text("12 people")
            }
            .background(.regularMaterial)
        }
        .font(.title)
    }
}

struct ScrollTheColorsTest: View {
    var items = [Color.blue, Color.red, Color.green, Color.yellow, Color.orange, Color.purple]
    @State var disabled = false

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer()
                
                ScrollView(Axis.Set.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(items, id: \.self) { color in
                            RoundedRectangle(cornerRadius: 15)
                                .fill(color)
                                .frame(width: geometry.size.width - 60, height: 200)
                            
                        }
                    }
                }
                .scrollDisabled(disabled)
                .padding(.trailing)
                .safeAreaInset(edge: .leading) {
                    VStack(spacing: 10) {
                        Text("Sccroll the colors")
                            .font(.body)
                        Image(systemName: "arrow.2.circlepath.circle")
                    }
                    .frame(maxHeight: .infinity)
                    .padding(.horizontal)
                    .background(.regularMaterial)
                }
                .frame(height: 200)
                Spacer()
                
                Toggle("Disable?", isOn: $disabled)
                    .padding()
                    .background(.regularMaterial)
            }
        }
    }
}

#Preview {
    ScrollTheColorsTest()
}

#Preview {
    ScrollViewTest()
}
