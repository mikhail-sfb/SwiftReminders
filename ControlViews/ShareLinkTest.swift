//
//  ShareLinkTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 11.11.24.
//

import SwiftUI

// MARK: Link can be styled and customised like a button
struct ShareLinkTest: View {
    var body: some View {
        Form {
            ShareLink(item: "Hello and welcome!")
            
            // have trailing closure btw for deco
            ShareLink("Just like a label for link" ,item: "Hello and welcome!")
            
            //The share destination has to support a subject and message (like email) for them to be used.
            ShareLink("Share text", item: "text", subject: Text("Subject"), message: Text("Message"), preview: SharePreview(Text("Preview"), image: Image(systemName: "arrow.2.circlepath.circle"), icon: Image(systemName: "person.crop.circle")))
            
            Section("Url") {
                ShareLink("Share url" ,item: URL(string: "https://www.apple.com")!)
            }

            Section("Colection") {
                ShareLink("Share collection" ,items: ["Hello?", "Game over", "Nooooo"])
            }
            
            Section("Photo") {
                ShareLink(item: Image(systemName: "person.crop.circle"), preview: SharePreview("The person?", image:  Image(systemName: "person.crop.circle"))) {
                    Label("Share Image", systemImage: "person.crop.circle")
                }
            }
            
            Section("Full example") {
                ShareLink("Full example btw!", item: "Some text we pass", subject: Text("This is a subject"), message: Text("Message ofc"), preview: SharePreview(Text("Share preview text"), image: Image(systemName: "doc.richtext"), icon: Image(systemName: "doc.richtext")))
            }
            .headerProminence(.increased)
        }
    }
}

#Preview {
    ShareLinkTest()
}
