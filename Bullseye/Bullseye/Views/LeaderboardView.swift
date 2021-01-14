//
//  LeaderboardView.swift
//  Bullseye
//
//  Created by Shaun Jacobsen on 14/01/2021.
//

import SwiftUI

struct LeaderboardView: View {
  
  @Binding var leaderboardVisible: Bool
  @Binding var game: Game
  
  var body: some View {
    ZStack {
      Color("BackgroundColour")
        .edgesIgnoringSafeArea(.all)
      VStack(spacing: 10) {
        HeaderView(leaderboardVisible: $leaderboardVisible)
        TableHeaderView()
        ScrollView {
          VStack(spacing: 10) {
            ForEach(game.leaderboardEntries.indices) { i in
              let entry = game.leaderboardEntries[i]
              RowView(index: i, score: entry.points, date: entry.date)
            }
          }
        }
      }
    }
  }
}

struct RowView: View {
  
  let index: Int
  let score: Int
  let date: Date
  
  var body: some View {
    HStack {
      RoundedTextView(text: String(index))
        .frame(width: Constants.General.roundedViewLength)
      Spacer()
      ScoreText(score: score)
        .frame(width: Constants.Leaderboard.scoreColWidth)
      Spacer()
      DateText(date: date)
        .frame(width: Constants.Leaderboard.dateColWidth)
    }
    .background(
      RoundedRectangle(cornerRadius: .infinity)
        .strokeBorder(Color("LeaderboardRowColour"), lineWidth: Constants.General.strokeWidth)
    )
    .padding(.leading)
    .padding(.trailing)
    .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
  }
}

struct HeaderView: View {
  
  @Binding var leaderboardVisible: Bool
  
  @Environment(\.verticalSizeClass) var verticalSizeClass
  @Environment(\.horizontalSizeClass) var horizontalSizeClass
  
  var body: some View {
    ZStack {
      HStack {
        if verticalSizeClass == .regular && horizontalSizeClass == .compact {
          LargeBoldText(text: "Leaderboard")
            .padding(.leading)
          Spacer()
        } else {
          LargeBoldText(text: "Leaderboard")
        }
      }
      
      HStack {
        Spacer()
        Button(action: {
          leaderboardVisible = false
        }) {
          RoundedSymbolFilledView(symbol: "xmark")
            .padding(.trailing)
        }
      }
      .padding(.top)
    }
  }
}

struct TableHeaderView: View {
  var body: some View {
    HStack {
      Spacer()
        .frame(width: Constants.General.roundedViewLength)
      Spacer()
      LabelText(text: "Score").frame(width: Constants.Leaderboard.scoreColWidth)
      Spacer()
      LabelText(text: "Date").frame(width: Constants.Leaderboard.dateColWidth)
    }
    .padding(.leading)
    .padding(.trailing)
    .frame(maxWidth: Constants.Leaderboard.maxRowWidth)
  }
}

struct LeaderboardView_Previews: PreviewProvider {
  static private var game = Binding.constant(Game(loadTestData: true))
  static var previews: some View {
//    LeaderboardView()
    LeaderboardView(leaderboardVisible: .constant(true), game: game)
    LeaderboardView(leaderboardVisible: .constant(true), game: game).previewLayout(.fixed(width: 568, height: 320))
    LeaderboardView(leaderboardVisible: .constant(true), game: game)
      .preferredColorScheme(.dark)
    LeaderboardView(leaderboardVisible: .constant(true), game: game).previewLayout(.fixed(width: 568, height: 320)).preferredColorScheme(.dark)
  }
}
