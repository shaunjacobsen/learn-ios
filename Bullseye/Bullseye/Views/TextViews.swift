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
      .frame(width: 35)
  }
}

struct LabelText: View {
  var text: String
  
  var body: some View {
    Text(text.uppercased())
      .font(.caption)
      .kerning(1.5)
      .foregroundColor(Color("TextColour"))
      .bold()
  }
}

struct InformativeText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .font(.caption)
      .foregroundColor(Color("TextColour"))
      .bold()
      .lineSpacing(10)
      .multilineTextAlignment(.center)
  }
}

struct ButtonText: View {
  var text: String
  
  var body: some View {
    Text(text)
      .foregroundColor(Color.white)
      .font(.body)
      .bold()
      .padding()
      .frame(maxWidth: .infinity)
      .background(Color.accentColor)
      .cornerRadius(12)
  }
}

struct TextViews_Previews: PreviewProvider {
  static var previews: some View {
    VStack {
      InstructionText(text: "Instructions")
      BigNumberText(text: "99")
      LabelText(text: "Score")
      InformativeText(text: "Some text here\n🎉🎉🎉")
      ButtonText(text: "Start New Round")
        .padding()
    }
  }
}
