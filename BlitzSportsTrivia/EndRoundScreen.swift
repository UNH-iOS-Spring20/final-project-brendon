//
//  EndRoundScreen.swift
//  BlitzSportsTrivia
//
//  Created by B Malouf on 4/29/20.
//  Copyright © 2020 Brendon Malouf. All rights reserved.
//

import SwiftUI

struct EndRoundScreen: View {
    @EnvironmentObject var round: Round
    @EnvironmentObject var screen: ScreenController
    
    var body: some View {
        VStack{
            Text("Round \(round.r) \(round.roundResult)").font(.largeTitle).padding(10)
            
            Text("Your Score: \(round.roundScore)").font(.title).padding(10)
            Text("Opponent Score: \(round.opRoundScore)").font(.title).padding(10)
            Button(action: {
                self.screen.sWScreenButton()
                self.round.roundContinue = true
                self.round.roundScore = 0
                self.round.strikes = 0
                self.round.opRoundScore = 0
                self.round.roundResult = ""
                self.round.answerStreak = 0
                self.round.r+=1
            }) {
                Text("Continue").font(.headline).padding(10)
            }
    
        }.background(/*@START_MENU_TOKEN@*/Color(hue: 0.008, saturation: 0.944, brightness: 0.476)/*@END_MENU_TOKEN@*/)
    }
}

struct EndRoundScreen_Previews: PreviewProvider {
    static let screen = ScreenController()
    static let game = Game()
    static let round = Round(p1: game.player1, p2: game.player2, r: game.roundNum)
    static var previews: some View {
        EndRoundScreen().environmentObject(round).environmentObject(screen)
    }
}
