//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ana Battistini on 15/02/24.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
  private static let emojis = ["👻", "💩", "😈", "👽", "🐯", "🐙", "🦋", "🐰", "🎃", "🐶", "🐸", "🐨"]
  
  private static func createMemoryGame() -> MemoryGame<String> {
    return MemoryGame(numberOfPairsOfCards: 12) { pairIndex in
      if emojis.indices.contains(pairIndex) {
        return emojis[pairIndex]
      } else {
       return "⁉️"
      }
    }
  }
  
  @Published private var model = createMemoryGame()
  
  var cards: Array<MemoryGame<String>.Card> {
    return model.cards
  }
  
  func shuffle() {
    model.shuffle()
  }
  
  func choose(_ card: MemoryGame<String>.Card) {
    model.choose(card)
  }
}
