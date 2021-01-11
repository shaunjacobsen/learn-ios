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
        return 100 - abs(sliderValue - target)
    }
}
