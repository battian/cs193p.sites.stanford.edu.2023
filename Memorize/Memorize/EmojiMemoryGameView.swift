//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Ana Battistini on 11/02/24.
//

import SwiftUI

struct EmojiMemoryGameView: View {
  @ObservedObject var viewModal: EmojiMemoryGame
  
  var body: some View {
    ScrollView {
      cards
    }
    Button("Shuffle") {
      viewModal.shuffle()
    }
    .padding()
  }
  
  var cards: some View {
    LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
      ForEach(viewModal.cards.indices, id: \.self) { index in
        CardView(viewModal.cards[index])
          .aspectRatio(2/3, contentMode: .fit)
          .padding(4)
      }
    }
    .foregroundColor(.orange)
  }
}

struct CardView: View {
  let card: MemoryGame<String>.Card
  
  init(_ card: MemoryGame<String>.Card) {
    self.card = card
  }
  
  var body: some View {
    ZStack {
      let base = RoundedRectangle(cornerRadius: 12)
      
      Group {
        base.fill(.white)
        base.stroke(lineWidth: 2)
        Text(card.content)
          .font(.system(size: 200))
          .minimumScaleFactor(0.01)
          .aspectRatio(1, contentMode: .fit)
        
      }
      .opacity(card.isFaceUp ? 1 : 0)
      
      base.opacity(card.isFaceUp ? 0 : 1)
    }
  }
}

#Preview {
  EmojiMemoryGameView(viewModal: EmojiMemoryGame())
}
