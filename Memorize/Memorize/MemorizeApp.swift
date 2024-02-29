//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Ana Battistini on 11/02/24.
//

import SwiftUI

@main
struct MemorizeApp: App {
  @StateObject var game = EmojiMemoryGame()
  
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(viewModal: game)
        }
    }
}
