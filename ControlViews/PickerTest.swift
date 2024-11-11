//
//  PickerTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 11.11.24.
//

import SwiftUI

struct PickerTest: View {
    @State var favoriteState = 1
    var states = ["California", "Utah", "Texas", "Minnesota", "Missouri", "Mississippi"]
    @State var favoriteState2 = "Minnesota"
    
    @State private var selectedDaysOption = "2"
    var numberOfDaysOptions = ["1", "2", "3", "4", "5"]
    
    var body: some View {
        Text("Pick state!")
        
        Picker("States", selection: $favoriteState) {
            Section {
                Text("California").tag(0)
                Text("Utah").tag(1)
                Text("Texas").tag(2)
            } header: {
                Text("First part")
            }
       
            Section {
                Text("Minnesota").tag(3)
                Text("Missouri").tag(4)
                Text("Mississippi").tag(5)
            } header: {
                Text("Second part")
            }
        }
        .pickerStyle(.menu)
        .background(RoundedRectangle(cornerRadius: 20).stroke(Color.blue, lineWidth: 1))
        .padding()
        
        Text("Pick state again?!")
        Picker(selection: $favoriteState2, label: Text("States")) {
            ForEach(states, id: \.self) { state in
                Text(state)
            }
        }
        .pickerStyle(.wheel)
        .background(Color.blue.opacity(0.2), in: Capsule())
        .padding()
        
        Text(favoriteState2)
            .foregroundStyle(.red)
            .font(.largeTitle)
        
        Button("To Minnesota") {
            withAnimation {
                favoriteState = 3
            }
        }
        
        // MARK: Notice how it would change inside a form
        Form {
            Picker("Frequency", selection: $selectedDaysOption) {
                ForEach(numberOfDaysOptions, id: \.self) {
                    Text("\($0) Days").tag($0)
                }
            }
            
            Picker("Frequency", selection: $selectedDaysOption) {
                ForEach(numberOfDaysOptions, id: \.self) {
                    Text("\($0) Days").tag($0)
                }
            }
            .pickerStyle(.menu)
            
            // MARK: Creates its own 
            Picker("Frequency", selection: $selectedDaysOption) {
                ForEach(numberOfDaysOptions, id: \.self) {
                    Text("\($0) Days").tag($0)
                }
            }
            .pickerStyle(.inline)
            
            Picker("Frequency", selection: $selectedDaysOption) {
                ForEach(numberOfDaysOptions, id: \.self) {
                    Text("\($0) Days").tag($0)
                }
            }
            .pickerStyle(.wheel)
            .padding(.vertical, -20)
        }
    }
}

#Preview {
    PickerTest()
}
