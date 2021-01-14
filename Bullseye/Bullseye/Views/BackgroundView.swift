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
    .background(RingsView())
  }
}

struct TopView: View {
  
  @Binding var game: Game
  @State private var leaderboardVisible = false
  
  var body: some View {
    HStack {
      Button(action: {
        game.restart()
      }, label: {
        RoundedSymbolStrokedView(symbol: "arrow.counterclockwise")
      })
      Spacer()
      Button(action: {
        leaderboardVisible = true
      }) {
        RoundedSymbolFilledView(symbol: "list.dash")
      }.sheet(isPresented: $leaderboardVisible, content: {
        LeaderboardView(leaderboardVisible: $leaderboardVisible, game: $game)
      })
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

struct RingsView: View {
  
  @Environment(\.colorScheme) var colorScheme
  
  var body: some View {
    ZStack {
      Color("BackgroundColour")
        .edgesIgnoringSafeArea(.all)
      ForEach(1..<6) { ring in
        let size = CGFloat(ring * 100)
        let opacity = colorScheme == .dark ? 0.1 : 0.3
        Circle()
          .stroke(lineWidth: 20)
          .fill(
            RadialGradient(gradient: Gradient(colors: [Color("RingColour").opacity(0.8 * opacity), Color("RingColour").opacity(0)]), center: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, startRadius: 100, endRadius: 300)
          )
          .frame(width: size, height: size)
          
      }
    }
    
  }
}

struct BackgroundView_Previews: PreviewProvider {
  static var previews: some View {
    BackgroundView(game: .constant(Game()))
  }
}
