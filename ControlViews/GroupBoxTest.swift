//
//  GroupBoxTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 7.11.24.
//

import SwiftUI

struct GroupBoxTest: View {
    @State var name: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            GroupBox("Hello?") {
                Text("Group Box")
                TextField("Name", text: $name)
                SecureField("Password", text: $password)
            }
            
            GroupBox {
                Text("Passsssss")
                SecureField("Password", text: $password)
            } label: {
                Text("not sorry")
            }
            
            ScrollView {
                ForEach(0..<10) { item in
                    GroupBox {
                        HStack {
                            Image(systemName: "person.circle")
                                .imageScale(.large)
                            
                            VStack(alignment: .leading) {
                                Text("User name: \(item)")
                                Text("Email: malaxa2000@gmail.com")
                            }
                            .frame(maxWidth: .infinity)
                        }
                    }
                }
            }
          
        }
        .padding()
    }
}

#Preview {
    GroupBoxTest()
}
