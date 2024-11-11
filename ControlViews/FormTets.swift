//
//  FormTets.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 6.11.24.
//

import SwiftUI

struct FormTets: View {
    @State var isOn: Bool = false
    @State var text: String = ""
    
    var body: some View {
        // MARK: “Forms come with a built-in scroll view
        // if the contents exceed the height of the screen.”
        Form {
            Section {
                Text("Hello, World!")
                    .font(.title)
                Text("Hello, mocked!")
                Toggle(isOn: $isOn) {
                    Text("Hellooooooooooo")
                }
                TextField("Text", text: $text)
                    .textFieldStyle(.roundedBorder)
                Text("Hello, mocked 1!")
                    .listRowBackground(Color.red)
                Text("Hello, mocked 2!")
            }
            
            Section {
                Text("Hello, World!")
                    .font(.title)
                Stepper(onIncrement: {}, onDecrement: {}) {
                    Text("Hello")
                }
                Text("Hello, mocked!")
                Text("Hello, mocked 1!")
                    .listRowInsets(EdgeInsets(top: 50, leading: 200, bottom: 10, trailing: 0))
                Color.red
            }
            .listRowBackground(Color.blue)
            
            Section {
                Text("Hello, World!")
                    .font(.title)
            } header: {
                Text("hello")
                    .headerProminence(.increased)
            // Can use outside to header
            } footer: {
                Text("Goodbye")
            }
            
            Section {
                DisclosureGroup("Audio") {
                    VStack {
                        Text("hello 1")
                        Text("hello 2")
                    }
                    .font(.title2)
                    .padding()
                }
            } header: {
                Text("Hoidaaaa")
            }
            .headerProminence(.standard)
            
        }
    }
}

#Preview {
    FormTets()
}
