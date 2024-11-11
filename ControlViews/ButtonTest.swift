//
//  Button.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 4.11.24.
//

import AuthenticationServices
import SwiftUI

struct ButtonExample: View {
    @State var editText = false
    @State var name = "Miksa"
    @FocusState var nameFocus: Bool

    var body: some View {
        VStack(spacing: 40) {
            Button("Regular", role: .destructive) {

            }
            .buttonStyle(.bordered)
            .tint(.purple)

            Button {

            } label: {
                Text("Hello?")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red, in: Capsule())
                    .shadow(color: .red, radius: 10)
                    .bold()
            }

            // MARK: APPLE sign in button
            VStack {
                SignInWithAppleButton(
                    .signIn,
                    onRequest: { request in },
                    onCompletion: { result in }
                )
                .frame(height: 50)

                SignInWithAppleButton(
                    .continue,
                    onRequest: { request in },
                    onCompletion: { result in }
                )
                .signInWithAppleButtonStyle(.whiteOutline)
                .frame(height: 50)
                
                SignInWithAppleButton(
                    .continue,
                    onRequest: { request in },
                    onCompletion: { result in }
                )
                .signInWithAppleButtonStyle(.whiteOutline)
                .frame(width: 70 , height: 100)

                SignInWithAppleButton(
                    .signUp,
                    onRequest: { request in },
                    onCompletion: { result in }
                )
                .signInWithAppleButtonStyle(.white)
                .frame(height: 50)
            }
            .padding(.horizontal)

            // MARK: Rename button
            //The rename button doesn’t do anything by itself. You need to pair it with a renameAction modifier to implement some code when the button is tapped

            if editText {
                HStack {
                    TextField("Name", text: $name)
                        .textFieldStyle(.roundedBorder)
                        .focused($nameFocus)
                    Button("Done") {
                        editText.toggle()
                    }
                }
                .padding()
            } else {
                HStack {
                    Text(name)
                    Spacer()
                    RenameButton()
                        .buttonStyle(.borderedProminent)
                }
                .padding()
            }

        }
        .renameAction {
            editText.toggle()
            nameFocus.toggle()
        }
        .font(.title)
    }
}

#Preview() {
    ButtonExample()
}
