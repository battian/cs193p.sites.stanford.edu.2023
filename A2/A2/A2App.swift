//
//  A2App.swift
//  A2
//
//  Created by Ana Battistini on 08/03/24.
//

import SwiftUI

@main
struct A2App: App {
  @StateObject var game = MemoryGameVM()
  
    var body: some Scene {
        WindowGroup {
            MemoryGameView(game: game)
        }
    }
}
