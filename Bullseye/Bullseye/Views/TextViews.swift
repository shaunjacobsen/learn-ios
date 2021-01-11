//
//  TextViews.swift
//  Bullseye
//
//  Created by Shaun Jacobsen on 11/01/2021.
//

import SwiftUI

struct InstructionText: View {
  var text: String
  
  var body: some View {
    Text(text.uppercased())
      .foregroundColor(Color("TextColour"))
      .bold()
      .kerning(2.0)
      // kerning has to go above the multilineTextAlignment, since that returns a View and not Text
      // ordering matters
      .multilineTextAlignment(.center)
      .lineSpacing(4)
      .font(.footnote)
  }
}

struct BigNumberText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .foregroundColor(Color("TextColour"))
      .kerning(-1.0)
      .font(.largeTitle)
      .fontWeight(.black)
      .bold()
  }
}

struct SliderLabelText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .foregroundColor(Color("TextColour"))
      .bold()
  }
}

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      InstructionText(text: "Instructions")
      BigNumberText(text: "99")
    }
  }
}
