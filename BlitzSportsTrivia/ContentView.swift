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
    @EnvironmentObject var screen:ScreenController
    var body: some View {
        //Text("Hello, World!")
        //MainScreen()
        VStack{
            if screen.screen == "MainScreen"{
                MainScreen()
            }
            
            if screen.screen == "SpinWheel" {
                SpinWheelScreen()
            }
            
            if screen.screen == "QuestionScreen"{
                QuestionScreen()
            }
            if screen.screen == "EndRound"{
                EndRoundScreen()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static let screen = ScreenController()
    static let game = Game()
    static let round = Round(p1: game.player1, p2: game.player2, r: game.roundNum)
    static var previews: some View {
        ContentView().environmentObject(round).environmentObject(screen)
        //ContentView()
    }
}
