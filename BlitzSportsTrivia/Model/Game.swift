//
//  Game.swift
//  BlitzSportsTrivia
//
//  Created by B Malouf on 3/16/20.
//  Copyright © 2020 Brendon Malouf. All rights reserved.
//

import SwiftUI

class Game: ObservableObject {
    var player1:Player
    var player2:Player
    var roundNum:Int = 0
    @Published var round:Round
    
    init() {
        player1 = Player(userName: "Player 1", totalXP: 0, currStreak: 0)!
        player2 = Player(userName: "Player 2", totalXP: 250, currStreak: 1)!
        roundNum = 1
        round = Round(p1: player1, p2: player2, r: roundNum)
    }
    
    func runGame(){
        
    }
    
}
