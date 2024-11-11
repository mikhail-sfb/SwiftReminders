//
//  SearchableTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 11.11.24.
//

import SwiftUI

// MARK: In iOS, the searchable modifier adds a text field to the NavigationStack.
// Using it without a navigation view will show nothing.
struct SearchableTest: View {
    var locations = ["Milton", "New York", "London", "Paris", "Tokyo", "Berlin", "Madrid", "Barcelona", "Rome", "Moscow"]
    @State var searchResults: [String] = []
    @State var locationSearch: String = ""
    @State var destination: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Where would you like to go?")
                
                Text(destination)
                    .bold()
                
                Spacer()
                
                DismissButton()
                
            }
            .searchable(text: $locationSearch) {
                ForEach(searchResults, id: \.self) { location in
                    Button(location) {
                        destination = location
                        locationSearch = ""
                        hideKeyboard()
                    }
                }
            }
            .onChange(of: locationSearch) { _ , searchText in
                searchResults = locations.filter {$0.hasPrefix(locationSearch) }
            }
        }
    }
}

struct FIlteringTest: View {
    var locations = ["Milton", "New York", "London", "Paris", "Tokyo", "Berlin", "Madrid", "Barcelona", "Rome", "Moscow"]
    @State var filteredLocations: [String] = []
    @State var locationSearch: String = ""
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                List(locationSearch.isEmpty ? locations : filteredLocations, id: \.self) { location in
                    if location == "Milton" {
                        Text(location)
                            .bold()
                        // MARK: This value would be inserted in to search field
                            .searchCompletion("Uragan")
                    } else {
                        Text(location)
                            .bold()
                    }
                    
                }
            }
        }
        // MARK: IF dont spec displayMode search would collapse in to nav view
        .searchable(text: $locationSearch, placement: .navigationBarDrawer(displayMode: .always), prompt: Text("Filter"))
        .onChange(of: locationSearch) { _, location in
            filteredLocations = locations.filter {$0.hasPrefix(location)}
        }
    }
}

// MARK: important stuff btw
struct DismissButton: View {
    @Environment(\.dismissSearch) var dismissSearch
    
    var body: some View {
        Button("Dismiss that") {
            dismissSearch()
        }
    }
}


// MARK: Hide keyboard extension
extension View {
    func hideKeyboard() {
        UIApplication.shared
            .sendAction(#selector(UIResponder.resolveInstanceMethod(_:)), to: nil, from: nil, for: nil)
    }
}

#Preview {
    SearchableTest()
}

#Preview {
    FIlteringTest()
}

// MARK: SwiftUI does have a way to dismiss/cancel the current search when using the searchable modifier. How it works is a little tricky. First of all, it is through the use of an environment value: @Environment(\.dismissSearch) var dismissSearch Here are some undocumented rules I have observed:It only works on a subview within the NavigationView.It will not work on the same view where the searchable modifier is used. So, the parent view (where the searchable modifier is) can NOT dismiss searching but the child view (subview) can.

