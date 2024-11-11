//
//  CarouselTest.swift
//  SwiftuiBook
//
//  Created by Michail Malashkevich on 5.11.24.
//

import SwiftUI

struct UnitCard: Identifiable {
    var id: UUID = .init()
    var title: String
    var color: Color

    static func mockedCards() -> [UnitCard] {
        [
            .init(title: "Card 1", color: .red),
            .init(title: "Card 2", color: .blue),
            .init(title: "Card 3", color: .green),
            .init(title: "Card 4", color: .yellow),
        ]
    }
}

struct CarouselTest: View {
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(UnitCard.mockedCards()) { unitCard in
                        GeometryReader { proxy in
                            let cardSize = proxy.size
                            
                            RoundedRectangle(cornerRadius: 20)
                                .foregroundStyle(unitCard.color)
                                .frame(width: cardSize.width, height: cardSize.height / 4)
                        }
                        .frame(width: size.width)
                  
                    }
             
                }
            }
            .scrollTargetBehavior(.paging)
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    CarouselTest()
}
