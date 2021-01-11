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

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    InstructionText(text: "🎯\nPut the bullseye as close as you can to")
  }
}
