//
//  NavigationStackTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 11.11.24.
//

import SwiftUI

struct NavigationStackTest: View {
    var body: some View {
        // MARK: Nav stack is looking for title inside itself
        //        NavigationStack {
        //            VStack {
        //                Divider()
        //                    .background(
        //                        LinearGradient(
        //                            colors: [.green, .blue]  ,
        //                            startPoint: .leading,
        //                            endPoint: .trailing
        //                        )
        //                        .opacity(0.5)
        //                        .shadow(.drop(radius: 2, y: 2))
        //                    )
        //                // MARK: this will not be in every nav stacks
        //
        //                Spacer()
        //            }
        //            .navigationTitle("Navigation Stack")
        
        NavigationStack {
            VStack {
                
            }
            .navigationTitle("Navigation Stack")
            .navigationBarTitleDisplayMode(.inline) // MARK: next ones will be inlined too
            .toolbar(.visible) // visability
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        
                    } label: {
                        Image(systemName: "arrow.2.circlepath.circle")
                            .padding(.horizontal)
                    }
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        
                    } label: {
                        Image(systemName: "arrow.2.circlepath.circle")
                            .padding(.horizontal)
                    }
                }
            }
            .tint(.red)
        }
        .onAppear {
            let appereance = UINavigationBarAppearance()
            
            appereance.backgroundColor = UIColor(Color.green.opacity(0.5))
            
            UINavigationBar.appearance().standardAppearance = appereance
            UINavigationBar.appearance().scrollEdgeAppearance = appereance
        }
    }
}

struct NavigationDestinationTest: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Button("Go back") {
            dismiss()
        }
        .navigationTitle("HOROSHO")
        .navigationBarBackButtonHidden(true)
        
        // MARK: by hiding the back button we losing swipe back
    }
}

#Preview {
    NavigationStackTest()
}
