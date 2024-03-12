//
//  MemoryGame.swift
//  A2
//
//  Created by Ana Battistini on 08/03/24.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
  private(set) var cards: Array<Card>
  private(set) var theme: Theme<CardContent>
  
  init(theme: Theme<CardContent>, cardContentFactory: (Int) -> CardContent) {
    self.theme = theme
    cards = []
    
    for pairIndex in 0..<theme.numberOfPairs {
      let content = cardContentFactory(pairIndex)
      
      cards.append(Card(content: content))
      cards.append(Card(content: content))
    }
    
    cards.shuffle()
  }
  
  var indexOfTheOneAndOnlyFaceUpCard: Int? {
    get { return cards.indices.filter { index in cards[index].isFaceUp }.only }
    set { return cards.indices.forEach { cards[$0].isFaceUp = (newValue == $0) } }
  }
  
  mutating func choose(_ card: Card) {
    if let chooseIndex = cards.firstIndex(where: { $0.id == card.id }) {
      if !cards[chooseIndex].isFaceUp && !cards[chooseIndex].isMatched {
        if let potentialMatchedIndex = indexOfTheOneAndOnlyFaceUpCard {
          if cards[chooseIndex].content == cards[potentialMatchedIndex].content {
            cards[chooseIndex].isMatched = true
            cards[potentialMatchedIndex].isMatched = true
          }
        } else {
          indexOfTheOneAndOnlyFaceUpCard = chooseIndex
        }
        cards[chooseIndex].isFaceUp = true
      }
    }
  }
  
  mutating func shuffle() {
    cards.shuffle()
  }
  
  struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
    var id = UUID()
    var isFaceUp = false
    var isMatched = false
    let content: CardContent
    
    var debugDescription: String {
      "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? " matched" : "")"
    }
  }
}

extension Array {
  var only: Element? {
    count == 1 ? first : nil
  }
}
