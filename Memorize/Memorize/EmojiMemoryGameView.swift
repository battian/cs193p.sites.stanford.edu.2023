//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Ana Battistini on 11/02/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
  var viewModal: EmojiMemoryGame = EmojiMemoryGame()
  
    var body: some View {
      ScrollView {
        cards
      }
      .padding()
    }
  
  var cards: some View {
    LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
      ForEach(viewModal.cards.indices, id: \.self) { index in
        CardView(card: viewModal.cards[index])
          .aspectRatio(2/3, contentMode: .fit)
      }
    }
    .foregroundColor(.orange)
  }
}

struct CardView: View {
  let card: MemoryGame<String>.Card
  
  var body: some View {
    ZStack {
      let base = RoundedRectangle(cornerRadius: 12)
      
      Group {
        base.fill(.white)
        base.stroke(lineWidth: 2)
        Text(card.content).font(.largeTitle)
      }
      .opacity(card.isFaceUp ? 1 : 0)
      
      base.opacity(card.isFaceUp ? 0 : 1)
    }
  }
}

#Preview {
  EmojiMemoryGameView()
}
