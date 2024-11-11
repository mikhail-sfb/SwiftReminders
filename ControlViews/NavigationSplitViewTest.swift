//
//  NavigationSplitView.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 11.11.24.
//

import SwiftUI

struct NavigationSplitViewTest: View {
    @State var visibility = NavigationSplitViewVisibility.all
    
    var body: some View {
        NavigationSplitView(columnVisibility: $visibility) {
            Text("Sidebar")
        } detail: {
            VStack {
                Text("Detail")
                Button("Show sidebar") {
                    visibility = .all
                }
            }
        }
        
        NavigationSplitView(columnVisibility: .constant(.all)) {
            Text("Sidebar")
                //.navigationSplitViewColumnWidth(100)
        } content: {
            Text("Content")
                //.navigationSplitViewColumnWidth(min: 300, ideal: 400, max: 400)
        } detail: {
            ZStack {
                Color.green.opacity(0.4)
                
                Text("Detail")
            }
        }
        .navigationSplitViewStyle(.automatic)
        // Automatic - width based on context, balanced - reduce size of detail content when showing sidebar, prominentDetail - Attempts to maintain the size of the detail column when showing the sidebar and content columns
        // Balanced - без фильтра над деталью, чисто уменьшаем размер
    }
}

// MARK: !!!! NAVIGATION IN SPLIT VIEW
struct NavLink_IsDetailLink: View {
    var body: some View {
        NavigationSplitView {
            VStack(spacing: 20) {
                NavigationLink("Navigate There ->") {
                    NavigationDestinationView()
                }
                
                NavigationLink("Navigate Here") {
                    NavigationDestinationView()
                }
                .isDetailLink(false) // Do not navigate to detail column
            }
            .navigationTitle("NavigationLink")
        } detail: {
            Text("Detail")
        }
        .font(.title)
    }
}

struct NavigationDestinationView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Navigation Destination")
        }
        .navigationTitle("Destination")
        .font(.title)
    }
}

#Preview {
    NavLink_IsDetailLink()
}

#Preview {
    NavigationSplitViewTest()
}
