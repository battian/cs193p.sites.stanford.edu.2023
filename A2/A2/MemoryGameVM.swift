//
//  MemoryGameViewModel.swift
//  A2
//
//  Created by Ana Battistini on 08/03/24.
//

import Foundation

class MemoryGameVM: ObservableObject {
  let themes: [Theme<String>] = [
    Theme(name: "Emojis", content: ["🤩", "😎", "😜", "😢", "😠", "😂", "😍", "😇", "😅", "😊"], numberOfPairs: 10, color: .yellow),
    Theme(name: "Animals", content: ["🐶", "🐱", "🐭", "🐰", "🐼", "🐨", "🐻", "🦊", "🦁", "🐯"], numberOfPairs: 10, color: .blue),
    Theme(name: "Food", content: ["🍕", "🍔", "🍟", "🍦", "🍰", "🍓", "🍩", "🍪", "🥗", "🍉"], numberOfPairs: 10, color: .green),
    Theme(name: "Transportation", content: ["🚗", "🚕", "🚌", "🚎", "🏎️", "🚓", "🚒", "🚑", "🚚", "🚂"], numberOfPairs: 10, color: .red),
    Theme(name: "Music", content: ["🎶", "🎵", "🎤", "🎧", "🎹", "🎸", "🎷", "🎺", "🥁", "🎻"], numberOfPairs: 10, color: .purple),
    Theme(name: "Sports", content: ["⚽", "🏀", "🎾", "🏈", "⚾", "🏐", "🏓", "🏸", "🥋", "🏊"], numberOfPairs: 10, color: .orange)
  ]
  
  @Published private var model: MemoryGame<String>
  
  init() {
    let randomThemeIndex = Int.random(in: 0..<themes.count)
    let selectedTheme = themes[randomThemeIndex]
    model = MemoryGameVM.createMemoryGame(theme: selectedTheme)
  }
  
  private static func createMemoryGame(theme: Theme<String>) -> MemoryGame<String> {
     return MemoryGame(theme: theme) { pairIndex in
       return theme.content[pairIndex]
     }
   }
  
  var cards: Array<MemoryGame<String>.Card> {
    return model.cards
  }
  
  var theme: Theme<String> {
    return model.theme
  }
  
  func shuffle() {
    model.shuffle()
  }
  
  func choose(_ card: MemoryGame<String>.Card) {
    model.choose(card)
  }
  
  func newGame() {
    let randomThemeIndex = Int.random(in: 0..<themes.count)
    let selectedTheme = themes[randomThemeIndex]
    model = MemoryGameVM.createMemoryGame(theme: selectedTheme)
  }
}
