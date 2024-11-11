//
//  NavigationLinkTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 11.11.24.
//

import SwiftUI

// MARK: works only in nivigationStack/view appereance just like button
struct NavigationLinkTest: View {
    @State var showSheet: Bool = false
    @State var navigate: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink("Just text", destination: SecondView())
                
                NavigationLink {
                    SecondView()
                } label: {
                    Label("Hello?", systemImage: "arrow.2.circlepath.circle")
                }
                
                NavigationLink(destination: SecondView()) {
                    Text("Go to SecondView")
                        .foregroundStyle(.white)
                        .padding()
                }
                .buttonStyle(.borderedProminent)
                .tint(.pink)
                
                NavigationLink {
                    SecondView()
                } label: {
                    LabeledContent("Hello?", value: 44, format: .number)
                }
                .padding()
                
                // MARK: with nav destination
                NavigationLink(value: "NavigationLink 1") {
                    Text("Navigate 1")
                }
                NavigationLink(value: true) {
                    Text("Navigate 2")
                }
                // This might be a confusing concept to understand at first.
                // Just know that when the navigation link button is tapped,
                // it will look for a navigationDestination modifier
                // that handles the same type as the value that is set.
                
                // MARK: Is presented
                Button("ShowSheet") {
                    showSheet.toggle()
                }
                .font(.largeTitle)
                .tint(.red)
            }
            .navigationDestination(for: String.self) { stringValue in
                Text("Value is: ") + Text(stringValue).bold()
            }
            .navigationDestination(for: Bool.self) { boolValue in
                Text("Value is: ") + Text("True!").bold()
            }
            .sheet(isPresented: $showSheet, content: {
                VStack(spacing: 16) {
                    NavigationLink(destination: Text("Destination from link")) {
                        Text("Navigation link")
                    }
                    Button("Button link") {
                        showSheet = false
                        navigate = true
                    }
                }
                .presentationDetents([.height(240)])
            })
            .navigationDestination(isPresented: $navigate, destination: {
                Text("destination from button")
            })
            .font(.title)
            .navigationTitle("NavigationLinkTest")
        }
    }
}

struct SecondView: View {
    var body: some View {
        Text("Hello from SecondView")
    }
}

#Preview {
    NavigationLinkTest()
}
