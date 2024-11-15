//
//  TextFieldTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 13.11.24.
//

import SwiftUI

// MARK: Main idea is that you style only by your own hands
struct TextFieldTest: View {
    @State var textFieldData = ""
    @State var actionTextFieldData = ""
    @State private var isEditing: Bool = false
    @State private var submitMessage = "What??"
    @FocusState private var focus: Bool
    enum NameFields {
        case firstName
        case familyName
    }
    @FocusState private var nameFields: NameFields?
    @State private var person = PersonNameComponents(
        givenName: "Oke", familyName: "Mala")

    var body: some View {
        VStack {
            // MARK: First value is a Hint
            TextField("Enter text 1", text: $textFieldData)
                .textFieldStyle(.roundedBorder)

            TextField("Enter Name 2", text: $textFieldData)
                .textFieldStyle(.roundedBorder)
                .font(.system(size: 36, weight: .bold, design: .monospaced))
                .italic()
                .multilineTextAlignment(.trailing)

            // MARK: Styles
            TextField("Enter text 3", text: $textFieldData)
                .padding()
                .background(RoundedRectangle(cornerRadius: 10))
                .foregroundStyle(
                    Color(hue: 0.126, saturation: 0.47, brightness: 0.993)
                )
                .padding()

            TextField("Placeholder", text: $textFieldData)
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10).stroke(
                        Color.orange, lineWidth: 2)
                )
                .foregroundStyle(.blue)

            TextField("Enter text 1", text: $textFieldData)
                .padding()
                .border(
                    LinearGradient(
                        colors: [.red, .blue], startPoint: .topLeading,
                        endPoint: .bottomTrailing), width: 2)

            // MARK: custom hint text
            ZStack(alignment: .leading) {
                if textFieldData.isEmpty {
                    Text("Enter text")
                        .font(Font.title.italic())
                        .foregroundStyle(.orange)
                }

                TextField("", text: $textFieldData)
            }
            .padding()
            .overlay {
                RoundedRectangle(cornerRadius: 25)
                    .stroke(.orange, lineWidth: 2)
            }

            HStack {
                TextField("Country", text: $textFieldData)
                Button {

                } label: {
                    Image(systemName: "arrow.2.circlepath.circle")
                        .padding(.horizontal)
                }
                .tint(.orange)
            }
            .padding()
            .overlay(Capsule().stroke(.orange, lineWidth: 2))
            // MARK: Keyboard type
            .keyboardType(.namePhonePad)

            // MARK: Autocorrection and able/disable (just use 1 modi)
            // also axis specs in which directions when text overflow would move
            TextField("Enter text 1", text: $textFieldData, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .autocorrectionDisabled()
                .disabled(true)  // MARK: disabling keyboard applies for to any view, not only that text field (can use with opacity down or etc)
                .autocapitalization(.none)  // MARK: First letter is autocapitalized, so we can change it
                .lineLimit(3...6) // MARK: Another cool stuff

            Divider()

            // MARK: Some actions stuff
            // - 1) when coursor is in the textField isEditing true, otherwise when it is dismissed or not longer in focus isEditing would be false
            Text(
                "Is editing: \(isEditing) and \(actionTextFieldData) and \(submitMessage)"
            )
            TextField("Actions", text: $actionTextFieldData) { isEditing in
                self.isEditing = isEditing
            }
            .onChange(
                of: actionTextFieldData,
                { _, newValue in
                    actionTextFieldData = String(newValue.prefix(3))
                }
            )
            .onSubmit {
                submitMessage = "Horray!"
            }
            .focused($focus)  // MARK: When true - triggers otherwise do not :) also can make enumed one
            .focused($nameFields, equals: .firstName)  // here it is
            .submitLabel(.continue)
            .font(.largeTitle)
            .textFieldStyle(.roundedBorder)

            Button {
                focus = false
            } label: {
                Text("Dismiss focus")
            }

            Button {
                if !actionTextFieldData.isEmpty {
                    nameFields = .firstName
                }
            } label: {
                Text("Save")
            }

            // MARK: can use lots of formatters, like percent and more
            TextField(
                "Enter name", value: $person, format: .name(style: .short)
            )
            .textFieldStyle(.roundedBorder)
        }
        .padding()
    }
}

#Preview {
    TextFieldTest()
}
