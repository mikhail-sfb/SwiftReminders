//
//  MenuTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 10.11.24.
//

import SwiftUI

struct MenuTest: View {
    var body: some View {
        HStack {
            Menu {
                Button(action: {}) {
                    Text("Open")
                    Image(systemName: "eyedropper.full")
                }
                
                Divider()
                
                Section {
                    Button(action: {}) {
                        Text("Open")
                        Image(systemName: "eyedropper.full")
                    }
                    
                    Button(action: {}) {
                        Text("Open")
                        Image(systemName: "eyedropper.full")
                    }
                }
                
            } label: {
                Image(systemName: "folder")
            }
            .menuOrder(.priority)
            
            Spacer()
        }
        .padding()
        
        Spacer()
    }
}

#Preview {
    MenuTest()
}
