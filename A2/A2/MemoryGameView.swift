//
//  MemoryGameView.swift
//  A2
//
//  Created by Ana Battistini on 08/03/24.
//

import SwiftUI

struct MemoryGameView: View {
  @ObservedObject var game: MemoryGameVM
  
  var body: some View {
    Text(game.theme.name)
      .font(.title)
       .foregroundColor(game.theme.color)
       .padding()
    Button("New Game") {
      game.newGame()
    }
    .padding(.horizontal, 24)
    
    ScrollView {
      cards
        .animation(.default, value: game.cards)
    }
    .padding([.leading, .trailing, .bottom])
  }
  
  var cards: some View {
    LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
      ForEach(game.cards) { card in
        CardView(card)
          .aspectRatio(2/3, contentMode: .fit)
          .padding(4)
          .onTapGesture {
            game.choose(card)
          }
      }
    }
    .foregroundColor(game.theme.color)
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
    .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
  }
}

#Preview {
  MemoryGameView(game: MemoryGameVM())
}
