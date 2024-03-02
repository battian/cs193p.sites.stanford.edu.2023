//
//  MemorizeGame.swift
//  Memorize
//
//  Created by Ana Battistini on 15/02/24.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
  private(set) var cards: Array<Card>
  
  init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
    cards = []
    
    for pairIndex in 0..<max(2, numberOfPairsOfCards) {
      let content = cardContentFactory(pairIndex)
      
      cards.append(Card(content: content, id: "\(pairIndex+1)a"))
      cards.append(Card(content: content, id: "\(pairIndex+1)b"))
    }
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
    var isFaceUp = false
    var isMatched = false
    let content: CardContent
    
    var id: String
    
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
