//
//  BackgroundView.swift
//  Bullseye
//
//  Created by Shaun Jacobsen on 11/01/2021.
//

import SwiftUI

struct BackgroundView: View {
  
  @Binding var game: Game
  
  var body: some View {
    VStack {
      TopView(game: $game)
      Spacer()
      BottomView(game: $game)
    }
    .padding()
    .background(Color("BackgroundColour").edgesIgnoringSafeArea(.all))
  }
}

struct TopView: View {
  
  @Binding var game: Game
  
  var body: some View {
    HStack {
      Button(action: {
        game.restart()
      }, label: {
        RoundedSymbolStrokedView(symbol: "arrow.counterclockwise")
      })
      Spacer()
      RoundedSymbolFilledView(symbol: "list.dash")
    }
  }
}

struct NumberView: View {
  var title: String
  var text: String
  
  var body: some View {
    VStack(alignment: .center, spacing: 5) {
      LabelText(text: title)
      RoundRectTextView(text: text)
    }
  }
}

struct BottomView: View {
  
  @Binding var game: Game
  
  var body: some View {
    HStack {
      NumberView(title: "Score", text: String(game.score))
      Spacer()
      NumberView(title: "Round", text: String(game.round))
    }
  }
}

struct BackgroundView_Previews: PreviewProvider {
  static var previews: some View {
    BackgroundView(game: .constant(Game()))
  }
}
