//
//  ContentView.swift
//  Bullseye
//
//  Created by Shaun Jacobsen on 09/01/2021.
//

import SwiftUI

struct ContentView: View {
  
  @State private var alertVisible = false
  @State private var sliderValue = 50.0
  @State private var game = Game()
  
  var body: some View {
    ZStack {
      BackgroundView(game: $game)
      VStack {
        InstructionsView(game: $game)
        SliderView(sliderValue: $sliderValue)
        HitMeButtonView(alertVisible: $alertVisible, sliderValue: $sliderValue, game: $game)
      }
    }
  }
}

struct InstructionsView: View {
  
  @Binding var game: Game
  
  var body: some View {
    VStack {
      InstructionText(text: "🎯\nPut the bullseye as close as you can to")
        .padding(.leading, 30)
        .padding(.trailing, 30)
      BigNumberText(text: String(game.target))
    }
  }
}

struct SliderView: View {
  @Binding var sliderValue: Double
  
  var body: some View {
    HStack {
      SliderLabelText(text: "1")
      Slider(value: $sliderValue, in: 1.0...100.0)
      SliderLabelText(text: "100")
    }
    .padding()
  }
}

struct HitMeButtonView: View {
  
  @Binding var alertVisible: Bool
  @Binding var sliderValue: Double
  @Binding var game: Game
  
  var body: some View {
    Button(action: {
      alertVisible = true
      
    }) {
      Text("Hit me".uppercased())
        .bold()
        .font(.title3)
    }
    .padding(20.0)
    .background(
      ZStack {
        Color("ButtonColour")
        LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
      }
    )
    .foregroundColor(Color.white)
    .cornerRadius(12)
    .overlay(
      RoundedRectangle(cornerRadius: 12)
        .strokeBorder(Color.white, lineWidth: 2)
    )
    .alert(isPresented: $alertVisible, content: {
      let roundedValue = Int(sliderValue.rounded())
      let points = game.points(sliderValue: roundedValue)
      return Alert(title: Text("Score!"), message: Text("You got: \(roundedValue) and earned \(points) points"), dismissButton: .default(Text(("Done"))) {
        game.startNewRound(points: points)
      })
    })
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
    ContentView().previewLayout(.fixed(width: 568, height: 320))
    ContentView()
      .preferredColorScheme(.dark)
    ContentView().previewLayout(.fixed(width: 568, height: 320)).preferredColorScheme(.dark)
  }
}
