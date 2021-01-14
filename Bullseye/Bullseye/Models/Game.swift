//
//  Game.swift
//  Bullseye
//
//  Created by Shaun Jacobsen on 10/01/2021.
//

import Foundation

struct LeaderboardEntry {
  let points: Int
  let date: Date
}

struct Game {
  var target = Int.random(in: 0...100)
  var score = 0
  var round = 1
  var leaderboardEntries: [LeaderboardEntry] = []
  
  init(loadTestData: Bool = false) {
    if loadTestData {
      leaderboardEntries.append(LeaderboardEntry(points: 100, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(points: 85, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(points: 200, date: Date()))
      leaderboardEntries.append(LeaderboardEntry(points: 450, date: Date()))
    }
  }
  
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
  
  mutating func addToLeaderboard(points: Int) {
    leaderboardEntries.append(LeaderboardEntry(points: points, date: Date()))
    leaderboardEntries.sort { $0.points > $1.points }
  }
  
  mutating func startNewRound(points: Int) -> Void {
    round += 1
    score += points
    target = Int.random(in: 0...100)
    addToLeaderboard(points: points)
  }
  
  mutating func restart() -> Void {
    round = 1
    score = 0
    target = Int.random(in: 0...100)
  }
}
