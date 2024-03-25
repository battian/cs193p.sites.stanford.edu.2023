//
//  CardView.swift
//  Memorize
//
//  Created by Ana Battistini on 23/03/24.
//

import SwiftUI

struct CardView: View {
  typealias Card = MemoryGame<String>.Card
  
  let card: Card
  
  private struct Constants {
    static let cornerRadius: CGFloat = 12
    static let lineWidth: CGFloat = 2
    static let inset: CGFloat = 5
    struct FontSize {
      static let largest: CGFloat = 200
      static let smallest: CGFloat = 10
      static let scaleFactor: CGFloat = smallest / largest
    }
  }
  
  init(_ card: Card) {
    self.card = card
  }
  
  var body: some View {
    ZStack {
      let base = RoundedRectangle(cornerRadius: Constants.cornerRadius)
      Group {
        base.fill(.white)
        base.strokeBorder(lineWidth: Constants.lineWidth)
        Text(card.content)
          .font(.system(size: Constants.FontSize.largest))
          .minimumScaleFactor(Constants.FontSize.scaleFactor)
          .multilineTextAlignment(.center)
          .aspectRatio(contentMode: .fit)
          .padding(Constants.inset)
      }
      .opacity(card.isFaceUp ? 1:0)
      base.fill()
        .opacity(card.isFaceUp ? 0:1)
    }
    .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
  }
}

#Preview {
  VStack {
    HStack {
      CardView(MemoryGame<String>.Card(content: "X", id: "teste1"))
      CardView(MemoryGame<String>.Card(isFaceUp: true, content: "Z", id: "teste1"))
    }
    HStack {
      CardView(MemoryGame<String>.Card(isMatched: true, content: "Y", id: "teste1"))
      CardView(MemoryGame<String>.Card(isFaceUp: true, isMatched: true, content: "W", id: "teste1"))
    }
  }
  
    .padding()
    .foregroundColor(.purple)
}
