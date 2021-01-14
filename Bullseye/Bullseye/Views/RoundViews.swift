//
//  RoundViews.swift
//  Bullseye
//
//  Created by Shaun Jacobsen on 11/01/2021.
//

import SwiftUI

struct RoundedSymbolStrokedView: View {
  
  var symbol: String
  
  var body: some View {
    Image(systemName: symbol)
      .font(.title)
      .foregroundColor(Color("TextColour"))
      .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
      .overlay(
        Circle()
          .strokeBorder(Color("ButtonStrokeColour"), lineWidth:  Constants.General.strokeWidth)
      )
    
  }
}

struct RoundedTextView: View {
  
  var text: String
  
  var body: some View {
    Text(text)
      .font(.title)
      .foregroundColor(Color("TextColour"))
      .frame(width: Constants.General.roundRectViewHeight, height: Constants.General.roundRectViewHeight)
      .overlay(
        Circle()
          .strokeBorder(Color("LeaderboardRowColour"), lineWidth:  Constants.General.strokeWidth)
      )
    
  }
}

struct RoundedSymbolFilledView: View {
  
  var symbol: String
  
  var body: some View {
    Image(systemName: symbol)
      .font(.title)
      .foregroundColor(Color("ButtonFilledTextColour"))
      .frame(width: Constants.General.roundRectViewWidth, height: Constants.General.roundRectViewHeight)
      .background(
        Circle()
          .fill(Color("ButtonFilledBackgroundColour"))
      )
  }
}

struct RoundRectTextView: View {
  var text: String
  
  var body: some View {
    Text(text)
      .foregroundColor(Color("TextColour"))
      .font(.title2)
      .bold()
      .kerning(-0.2)
      .frame(width: Constants.General.roundRectViewWidth, height: 55)
      .overlay(
        RoundedRectangle(cornerRadius: Constants.General.roundRectCornerRadius)
          .strokeBorder(Color("ButtonStrokeColour"), lineWidth:  Constants.General.strokeWidth)
      )
  }
}

struct PreviewView: View {
  var body: some View {
    VStack {
      RoundedTextView(text: "12")
      RoundedSymbolStrokedView(symbol: "arrow.counterclockwise")
      RoundedSymbolFilledView(symbol: "list.dash")
      RoundRectTextView(text: "99")
    }
  }
}

struct RoundViews_Previews: PreviewProvider {
  static var previews: some View {
    PreviewView()
    PreviewView()
      .preferredColorScheme(.dark)
  }
}
