//
//  ContentView.swift
//  BlitzSportsTrivia
//
//  Created by Brendon Malouf on 2/17/20.
//  Copyright © 2020 Brendon Malouf. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var round: Round
    var body: some View {
        //Text("Hello, World!")
        //MainScreen()
        QuestionScreen()
        //SpinWheelScreen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static let game = Game()
    static let round = Round(p1: game.player1, p2: game.player2, r: game.roundNum)
    static var previews: some View {
        ContentView().environmentObject(round)
        //ContentView()
    }
}
