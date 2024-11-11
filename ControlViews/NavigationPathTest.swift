//
//  NavigationPath.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 11.11.24.
//

import SwiftUI

enum Screens {
    case screen1
    case screen2
    case screen3
}

struct ProductForNavigation: Hashable {
    var name = ""
    var price = 0.0
}

struct CreditCardForNavigation: Hashable {
    var number = ""
    var expiration = ""
}

struct NavigationPathTest: View {
    @State var navPath: [Screens] = []
    
    var body: some View {
        NavigationStack(path: $navPath) {
            VStack {
                Button("Deep link to 2 screen") {
                    navPath.append(.screen1)
                    navPath.append(.screen2)
                }
                
                Button("Deep link to 3 screen") {
                    navPath.append(contentsOf: [.screen1, .screen2, .screen3])
                }
            }
        }
        .navigationDestination(for: Screens.self) { screenEnum in
            NavigationController.navigate(to: screenEnum)
        }
    }
}

class NavigationController {
    @ViewBuilder
    static func navigate(to screen: Screens) -> some View {
        switch screen {
        case .screen1:
            Image(systemName: "1.square.fill")
        case .screen2:
            Image(systemName: "2.square.fill").font(.largeTitle).foregroundStyle(.red)
        case .screen3:
            Image(systemName: "3.square.fill").font(.largeTitle).foregroundStyle(.blue)
        }
    }
}

struct NavigationPathTest2: View {
    @State var product = ProductForNavigation(name: "Oke", price: 100)
    @State var cc = CreditCardForNavigation(number: "5111 1111 1111 1111", expiration: "02/28")
    // MARK: holds diverse data types
    @State var navPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navPath) {
            Form {
                NavigationLink(value: product) {
                    Text(product.name)
                }
                
                NavigationLink(value: cc) {
                    Text(cc.expiration)
                }
            }
            .navigationTitle("Navigation Path Test")
            .navigationDestination(for: ProductForNavigation.self) { product in
                Form {
                    Text(product.name)
                    Text(String(product.price))
                }
                .navigationTitle("Product")
            }
            .navigationDestination(for: CreditCardForNavigation.self) { card in
                Form {
                    Text(card.expiration)
                    Text(card.number)
                }
                .navigationTitle("Product")
            }
        }
    }
}

#Preview {
    NavigationPathTest()
}

#Preview {
    NavigationPathTest2()
}
