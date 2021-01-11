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
      .frame(width: 56, height: 56)
      .overlay(
        Circle()
          .strokeBorder(Color("ButtonStrokeColour"), lineWidth: 2)
      )
    
  }
}

struct RoundedSymbolFilledView: View {
  
  var symbol: String
  
  var body: some View {
    Image(systemName: symbol)
      .font(.title)
      .foregroundColor(Color("ButtonFilledTextColour"))
      .frame(width: 56, height: 56)
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
      .frame(width: 68, height: 55)
      .overlay(
        RoundedRectangle(cornerRadius: 21)
          .strokeBorder(Color("ButtonStrokeColour"), lineWidth: 2)
      )
  }
}

struct PreviewView: View {
  var body: some View {
    VStack {
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
