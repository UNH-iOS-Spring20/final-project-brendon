//
//  Game.swift
//  BlitzSportsTrivia
//
//  Created by B Malouf on 3/16/20.
//  Copyright © 2020 Brendon Malouf. All rights reserved.
//

import SwiftUI

class Game: ObservableObject{
    @EnvironmentObject var screen:ScreenController
    var player1:Player
    var player2:Player
    var roundNum:Int = 0
    var round:Round
    
    init() {
        
        //All of the arrays involoving questions/answers initialized below
        player1 = Player(userName: "Player 1", totalXP: 0, currStreak: 0)!
        player2 = Player(userName: "Player 2", totalXP: 250, currStreak: 1)!
        roundNum = 1
        round = Round(p1: player1, p2: player2, r: roundNum)
        //print(self.screen.screen)
        //runGame()
    }
    
    func runGame(){
        
        for roundNum in 0...5{ //5 rounds per game
            if self.round.roundContinue == false
            {
                self.roundNum += 1
                round = Round(p1: player1, p2: player2, r: roundNum)
            }
        }
        
    }
    
}
