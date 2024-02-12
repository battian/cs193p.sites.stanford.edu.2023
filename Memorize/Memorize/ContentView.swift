//
//  ContentView.swift
//  Memorize
//
//  Created by Ana Battistini on 11/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      HStack {
        CardView(isFaceUp: true)
        CardView()
        CardView()
      }
      .foregroundColor(.orange)
      .padding()
    }
}

struct CardView: View {
  var isFaceUp: Bool = false
  
  var body: some View {
    if isFaceUp {
      ZStack {
        RoundedRectangle(cornerRadius: 12).foregroundColor(.white)
        RoundedRectangle(cornerRadius: 12).stroke(lineWidth: 2)
        Text("👻").font(.largeTitle)
      }
    } else {
      RoundedRectangle(cornerRadius: 12)
    }
  }
}

#Preview {
    ContentView()
}
