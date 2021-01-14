//
//  PointsView.swift
//  Bullseye
//
//  Created by Shaun Jacobsen on 12/01/2021.
//

import SwiftUI

struct PointsView: View {
  
  @Binding var game: Game
  @Binding var sliderValue: Double
  @Binding var alertVisible: Bool
  
  var body: some View {
    let roundedValue = Int(sliderValue.rounded())
    let points = game.points(sliderValue: roundedValue)
    VStack(spacing: 10) {
      InstructionText(text: "The slider's value is")
      BigNumberText(text: String(roundedValue))
      InformativeText(text: "You scored \(points) points")
      Button(action: {
        withAnimation {
          alertVisible = false
        }
        game.startNewRound(points: points)
      }) {
        ButtonText(text: "Start New Round")
      }
    }
    .padding()
    .frame(maxWidth: 300)
    .background(Color("BackgroundColour"))
    .cornerRadius(Constants.General.roundRectCornerRadius)
    .shadow(radius: 10, x: 5, y: 5)
    .transition(.scale)
  }
}

struct PointsView_Previews: PreviewProvider {
  
  static private var alertVisible = Binding.constant(false)
  static private var sliderValue = Binding.constant(50.0)
  static private var game = Binding.constant(Game())
  
  static var previews: some View {
    PointsView(game: game, sliderValue: sliderValue, alertVisible: alertVisible)
    PointsView(game: game, sliderValue: sliderValue, alertVisible: alertVisible).previewLayout(.fixed(width: 568, height: 320))
    PointsView(game: game, sliderValue: sliderValue, alertVisible: alertVisible)
      .preferredColorScheme(.dark)
    PointsView(game: game, sliderValue: sliderValue, alertVisible: alertVisible).previewLayout(.fixed(width: 568, height: 320)).preferredColorScheme(.dark)
  }
}
