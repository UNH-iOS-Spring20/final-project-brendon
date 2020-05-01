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
            Text("Round \(round.r) \(round.roundResult)")
            Text("Your Score: \(round.roundScore)")
            Text("Opponent Score: \(round.opRoundScore)")
            Button(action: {self.screen.sWScreenButton()}) {
            Text("Continue")
            }
        }
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
