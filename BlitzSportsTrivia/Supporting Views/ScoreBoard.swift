//
//  ScoreBoard.swift
//  BlitzSportsTrivia
//
//  Created by B Malouf on 4/16/20.
//  Copyright © 2020 Brendon Malouf. All rights reserved.
//

import SwiftUI

struct ScoreBoard: View {
    @EnvironmentObject var game: Game //allows for the use of round data
    var body: some View {
        VStack{
            
            Text("SCOREBOARD")
            Text("\(game.player1.userName): \(game.player1.gameScore) rounds")
            Text("\(game.player2.userName): \(game.player2.gameScore) rounds")
        }
    }
}

struct ScoreBoard_Previews: PreviewProvider {
    static let game = Game()
    static var previews: some View {
        ScoreBoard().environmentObject(game)
    }
}
