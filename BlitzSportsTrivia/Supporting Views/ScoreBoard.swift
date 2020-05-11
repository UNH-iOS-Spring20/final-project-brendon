//
//  ScoreBoard.swift
//  BlitzSportsTrivia
//
//  Created by B Malouf on 4/16/20.
//  Copyright © 2020 Brendon Malouf. All rights reserved.
//

import SwiftUI

struct ScoreBoard: View {
    @EnvironmentObject var game: Game
    @EnvironmentObject var round: Round
    var body: some View {
        HStack(spacing:25) {
            VStack(spacing:15){
                Text("\(game.p1UN)")
                    .font(.headline)
                Text("\(round.gameScore)")
            }.foregroundColor(.green).background(Color.white).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
            VStack(spacing:15){
                Text("\(game.p2UN)")
                    .font(.headline)
                Text("\(round.opGameScore)")
            }.foregroundColor(.red).background(Color.white).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: 1)
            //Text("SCOREBOARD")
            //Text("\(game.p1UN): \(round.gameScore) rounds")
            //Text("\(game.p1UN): \(round.opGameScore) rounds")
        }.padding(.all).font(.headline).foregroundColor(.red).background(Color.white).overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.black, lineWidth: 5)
        )
    }
}

struct ScoreBoard_Previews: PreviewProvider {
    static let game = Game()
    static let round = Round(p1: game.player1, p2: game.player2, r: game.roundNum)
    static var previews: some View {
        ScoreBoard().environmentObject(game).environmentObject(round)
    }
}
