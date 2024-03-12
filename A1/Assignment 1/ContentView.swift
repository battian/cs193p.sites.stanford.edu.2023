//
//  ContentView.swift
//  Assignment 1
//
//  Created by Ana Battistini on 13/02/24.
//

import SwiftUI

let themes: [[String]] = [
  ["🐶", "🐱", "🐭", "🐹", "🦊", "🐻", "🐶", "🐱", "🐭", "🐹", "🦊", "🐻"],
  ["🚗", "🚕", "🚆", "🚂", "🚁", "🚢", "🚗", "🚕", "🚆", "🚂", "🚁", "🚢"],
  ["😌", "😍", "😎", "😜", "🤔", "😂", "😌", "😍", "😎", "😜", "🤔", "😂"]
]

let themeOptions = ["Animals", "Vehicles", "Faces"]
let colors: [Color] = [.indigo, .red, .orange]

struct ContentView: View {
  @State private var selectedThemeIndex = 0
  @State private var theme: [String] = themes[0]
  
  var body: some View {
    VStack {
      Text("Memorize")
        .font(.largeTitle)
        .foregroundColor(colors[selectedThemeIndex])
      ThemePicker
      ScrollView {
        cards
      }
    }
    .padding()
    .onChange(of: selectedThemeIndex) {
      theme = themes[selectedThemeIndex].shuffled()
    }
  }
  
  var ThemePicker: some View {
    Picker("Please choose a theme", selection: $selectedThemeIndex) {
      ForEach(themeOptions.indices, id: \.self) { index in
        Text(themeOptions[index])
      }
    }
    .pickerStyle(SegmentedPickerStyle())
    .padding()
  }
  
  var cards: some View {
    LazyVGrid(columns: [GridItem(.adaptive(minimum: 90))]) {
      ForEach(theme.indices, id: \.self) { index in
        CardView(content: theme[index])
          .aspectRatio(3/3, contentMode: .fit)
      }
    }
    .foregroundColor(colors[selectedThemeIndex])
  }
}

struct CardView: View {
  let content: String
  @State var isFaceUp: Bool = false
  
  var body: some View {
    ZStack {
      let base = RoundedRectangle(cornerRadius: 12)
      
      Group {
        base.fill(.white)
        base.stroke(lineWidth: 2)
        Text(content).font(.largeTitle)
      }
      .opacity(isFaceUp ? 1 : 0)
      
      base.opacity(isFaceUp ? 0 : 1)
    }
    .onTapGesture {
      isFaceUp.toggle()
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
