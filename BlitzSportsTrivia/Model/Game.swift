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
    var deltaXP:Int //calculates change in xp
    var level:Int
    var newXP:Int
    var p1UN: String
    var p2UN: String
    init() {
        deltaXP = 0
        newXP = 0
        //All of the arrays involoving questions/answers initialized below
        player1 = Player(userName: "Player 1", totalXP: 0, currStreak: 0)!
        player2 = Player(userName: "Player 2", totalXP: 250, currStreak: 1)!
        level = player1.level
        p1UN = player1.userName
        p2UN = player2.userName
        roundNum = 1
        round = Round(p1: player1, p2: player2, r: roundNum)
        //print(self.screen.screen)
        
    }
    
    func endGame(result:String){
        let prevXP:Int = player1.totalXP
        
        if(result == "Winner!"){
            player1.baseWinXP()
        }
        else if(result == "Tough Loss..."){
            player1.baseLossXP()
        }
        
        deltaXP = prevXP + player1.totalXP
        newXP = player1.totalXP
    }
}
