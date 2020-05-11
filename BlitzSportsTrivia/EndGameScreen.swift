//
//  EndGameScreen.swift
//  BlitzSportsTrivia
//
//  Created by B Malouf on 5/10/20.
//  Copyright © 2020 Brendon Malouf. All rights reserved.
//

import SwiftUI

struct EndGameScreen: View {
    @EnvironmentObject var round: Round
    @EnvironmentObject var screen: ScreenController
    @EnvironmentObject var game: Game
    
    var body: some View {
        VStack(spacing:25){
            Text("\(round.gameResult)")
                .font(.largeTitle)
            Text("Level \(game.level)")
                .font(.title)
                .foregroundColor(Color.gray)
            Text("Total XP: \(game.newXP) (\(game.deltaXP))")
                .font(.headline)
            Button(action: {
                self.screen.mSButton()
            }) {
            Text("Back to Main Menu")
            }.padding(.all).font(.headline).foregroundColor(.blue).background(Color.white).overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.blue, lineWidth: 3)
            )
        }
        
    }
}

struct EndGameScreen_Previews: PreviewProvider {
    static let screen = ScreenController()
    static let game = Game()
    static let round = Round(p1: game.player1, p2: game.player2, r: game.roundNum)
    static var previews: some View {
        EndGameScreen().environmentObject(round).environmentObject(screen).environmentObject(game)
    }
}
