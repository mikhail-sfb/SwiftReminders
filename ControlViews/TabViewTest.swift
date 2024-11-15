//
//  TabViewTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 11.11.24.
//

import SwiftUI

struct TabViewTest: View {
    var body: some View {
        TabView {
            Text("1")
                .tabItem { Image(systemName: "1.circle") }
            
            Text("2")
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("2")
                }
            
            Text("3")
                .tabItem {
                    Text("3")
                }
            
            // MARK: Ios14+ can use label
            Text("4")
                .tabItem {
                    Label("4", systemImage: "4.circle")
                }
            
            Spacer()
            
            // MARK: When there are too many tabs to fit for the device, the More button is created where you can find the rest of the tabs listed out
        }
    }
}

struct TabViewSelectionTest: View {
    @State var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab) {
            VStack(spacing: 20) {
                Spacer()
                
                Text("By default for icons it uses filled versioins of images")
                    .bold()
                    .padding()
                    .background(Color.green, in: RoundedRectangle(cornerRadius: 10))
                    .foregroundStyle(.white)
                Text("Original SF Symbols:")
                Image(systemName: "star")
                Image(systemName: "moon")
                Image(systemName: "sun.min")

                Button("Go to 2?") {
                    selectedTab = 1
                }
                
                Spacer()
                
                Button("test") {
    
                }
                .padding()
                .background(Color.red, ignoresSafeAreaEdges: .top) // MARK: - to prevent back from ignoring safe area from all sides to just top, BACKGROUND IGNORES ALL SAFE AREA EDGES BY DEFAULT FROM Ios15+
                //  In this example, the thin material blur is touching the tab view
                //  safe area and by default it will ignore all safe area edges.
                Divider()
                    .background(.ultraThickMaterial)
                    //.background(Color.blue.opacity(0.1))

            }
            .tabItem {
                Image(systemName: "star.fill")
            }
            .tag(0)
            
            Button("Go to 1?") {
                selectedTab = 0
            }
            .tabItem {
                Image(systemName: "moon.fill")
            }
            .tag(1)
            .badge(6)
            // MARK: The operating system will set the color of the badge.There isn’t a way to change the color.
        }
        .tint(.green)
        .onAppear {
            let appereance = UITabBarAppearance()
            appereance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
            appereance.backgroundColor = UIColor(Color.green.opacity(0.2))
            UITabBar.appearance().standardAppearance = appereance // used when scroll behind
            UITabBar.appearance().scrollEdgeAppearance = appereance
        }
    }
}

struct SwipableTabView: View {
    var body: some View {
        TabView {
            Text("First")
            Text("Second")
            Text("Third")
        }
        // Just 1 line and we swipe
        .tabViewStyle(.page)
        // MARK: Dots!
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        // MARK: NO DOTS!
        // .tabViewStyle(.page(indexDisplayMode: .never))

        // MARK: great benefit is that we can use it as scroll and ForEach
        
    }
}

#Preview {
    SwipableTabView()
}

#Preview {
    TabViewSelectionTest()
}

#Preview {
    TabViewTest()
}
