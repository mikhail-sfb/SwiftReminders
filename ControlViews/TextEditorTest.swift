//
//  TextEditor.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 12.11.24.
//

import SwiftUI

#if canImport(UIKit)
    extension View {
        func hideKeyboard2() {
            UIApplication.shared.sendAction(
                #selector(UIResponder.resignFirstResponder), to: nil, from: nil,
                for: nil)
        }
    }
#endif

// MARK: provide input that goes beyond 1 line
struct TextEditorTest: View {
    @State var text: String = "oooooooo... hello?"

    var body: some View {
        VStack {
            HStack {
                Text("Dismiss the keyboard:")

                Spacer()

                Button {
                    hideKeyboard2()
                } label: {
                    Image(systemName: "keyboard.chevron.compact.down")
                        .foregroundStyle(.blue)
                }
            }

            TextEditor(text: $text)
                .font(.title.italic())
                .lineLimit(2)
                .lineSpacing(-2)
                .padding(2)
                .background(
                    RoundedRectangle(cornerRadius: 8).stroke(
                        .blue, lineWidth: 2)
                )
                .frame(height: 100)
                .multilineTextAlignment(.center)
                .tint(.pink)
        }
        .padding()
    }
}

#Preview {
    TextEditorTest()
}
