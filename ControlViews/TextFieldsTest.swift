//
//  TextFieldsTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 11.11.24.
//

import SwiftUI

struct TextFieldsTest: View {
    @State var password = ""
    
    var body: some View {
        //MARK: Start with password one - secure
        VStack {
            Text("Entered password: \(password)")
            
            // Style the field method 1
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(.purple)
                    .opacity(0.2)
                
                SecureField("Password", text: $password, prompt: Text("Hello??"))
                    .padding(.horizontal)
            }
            .frame(height: 40)
                
            // Style the field method 2
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.purple)
                .opacity(0.2)
                .overlay(content: { SecureField("Password", text: $password).padding(.horizontal) })
                .frame(height: 40)
        }
        .padding()
    }
}

#Preview {
    TextFieldsTest()
}
