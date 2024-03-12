//
//  Theme.swift
//  A2
//
//  Created by Ana Battistini on 08/03/24.
//

import SwiftUI

struct Theme<CardContent> {
  var name: String
  var content: [CardContent]
  var numberOfPairs: Int
  var color: Color
}
