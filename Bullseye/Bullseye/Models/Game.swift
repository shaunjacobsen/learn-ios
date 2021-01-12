//
//  Game.swift
//  Bullseye
//
//  Created by Shaun Jacobsen on 10/01/2021.
//

import Foundation

struct Game {
  var target = Int.random(in: 0...100)
  var score = 0
  var round = 1
  
  func points(sliderValue: Int) -> Int {
    let distanceFromTarget = abs(sliderValue - target)
    var bonus: Int = 0
    if (distanceFromTarget == 0) {
      bonus = 100
    } else if (distanceFromTarget <= 2) {
      // within 2 of target, 50 point bonus
      bonus = 50
    }
    
    return 100 - distanceFromTarget + bonus
  }
  
  mutating func startNewRound(points: Int) -> Void {
    round += 1
    score += points
    target = Int.random(in: 0...100)
  }
  
  mutating func restart() -> Void {
    round = 1
    score = 0
    target = Int.random(in: 0...100)
  }
}
