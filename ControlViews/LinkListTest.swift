//
//  LinkListTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 7.11.24.
//

import SwiftUI

struct LinkListTest: View {
    @State private var mockedStringArray = ["Hello", "World", "SwiftUI", "Book", "SwiftUIBook", "SwiftUIBook", "some", "random", "string", "array", "more"]
    @State private var currentlySelected: String?
    // MARK: can make a set: @State private var currentlySelected: Set<String>()
    
    var body: some View {
        Text("\(currentlySelected ?? "No selection") - selected")
        
        // MARK: Link navigates you outside the app
        Link("Open Safari", destination: URL(string: "https://www.safari.com")!)
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.roundedRectangle)
            .controlSize(.extraLarge)
            .tint(.mint)
        Link("Open app store", destination: URL(string: "https://apps.apple.com/app/id14996")!)
        
        List {
            // MARK: “Badges only work on List rows, Tabs, and Menus”
            // “Using badge on list rows will add a number to the end of the row.”
            Text("Hello")
                .badge(4)
            Text("Hello 2")
            // MARK: REALLY COOL
                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                    Button {
                        
                    } label: {
                       Image(systemName:  "arrow.uturn.backward.square" )
                            .foregroundStyle(.green)
                    }
                    
                }
            
            Section {
                Text("Hello 3")
            } header: {
                Text("Section header")
                    .padding(.top, -5)
            }
            footer: {
                Text("Section footer")
            }
            .headerProminence(.increased)
        }
        .background(Color.blue)
        .scrollContentBackground(.hidden)
        .listRowSpacing(10)
        .listStyle(.sidebar)
        .listRowSeparator(.visible)
        .listRowSeparatorTint(.blue, edges: .top)
        // MARK: We can refresh data here!
        .refreshable {
            
        }
        
        List {
            Section(header: Text("Want full?"), footer: Text("No full")) {
                Label("Full", systemImage: "arrow.2.circlepath.circle")
                Label("Full", systemImage: "arrow.2.circlepath.circle")
                Label("Full", systemImage: "arrow.2.circlepath.circle")
                Label("Full", systemImage: "arrow.2.circlepath.circle")
                    .listItemTint(.red)

            }
           
        }
        .listStyle(.sidebar)
        .tint(.green)
        
        List(mockedStringArray, id: \.self) { string in
            Text(string)
        }
        .safeAreaInset(edge: .bottom) {
            VStack {
                Divider()
                Text("Total \(mockedStringArray.count)")
            }
            .background(.bar)
        }
        
        // MARK: List modifiers do not apply to List itself, rather forEach
        // onDelete, onMove, onInsert - These three functions only work on views that implement the DynamicViewContent protocol. Currently, the only view that conforms to the DynamicViewContent protocol is the ForEach view. So these functions are only available on a ForEach view, not a List view.
        
        NavigationStack {
            List(selection: $currentlySelected) {
                Section {
                    ForEach(mockedStringArray, id: \.self) { string in
                        Text(string)
                            .selectionDisabled(string == "some")
                            .listRowBackground(Color.red)
                            .listRowInsets(EdgeInsets(top: 10, leading: 20, bottom: 0, trailing: 0))
                    }
                    .onMove { source, destinaton in
                        mockedStringArray.move(fromOffsets: source, toOffset: destinaton)
                    }
                    .onDelete { offsets in
                        mockedStringArray.remove(atOffsets: offsets)
                    }
                } header: {
                    Text("How?")
                        .bold()
                }
            }
            .navigationTitle("Test")
            .toolbar {
                ToolbarItem {
                    EditButton()
                }
            }
        }
    }
}

#Preview {
    LinkListTest()
}
