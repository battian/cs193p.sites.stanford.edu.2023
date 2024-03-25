//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Ana Battistini on 15/02/24.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
  typealias Card = MemoryGame<String>.Card
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
  
  var cards: Array<Card> {
    model.cards
  }
  
  var color: Color {
    color
  }
  
  func shuffle() {
    model.shuffle()
  }
  
  func choose(_ card: Card) {
    model.choose(card)
  }
}
