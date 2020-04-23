
//  QuestionScreen.swift
//  BlitzSportsTrivia
//
//  Created by B Malouf on 3/16/20.
//  Copyright © 2020 Brendon Malouf. All rights reserved.
//

import SwiftUI

struct QuestionScreen: View {
    @EnvironmentObject var round: Round //allows for the use of round data
    
    var body: some View {
        VStack(){
            Text("QIndex: \(round.qIndex)")
            Text(round.questArr[round.qIndex]).padding(.all)
            
            Button(action: {
                self.round.choiceSelected = 0
                self.round.selectAns()
                
            }) {
                Text(round.displayAns[0]).padding(.all)
                
            }
            Button(action: {
                self.round.choiceSelected = 1
                self.round.selectAns()
            }) {
                Text(round.displayAns[1]).padding(.all)
                
            }
            Button(action: {
                self.round.choiceSelected = 2
                self.round.selectAns()
            }) {
                Text(round.displayAns[2]).padding(.all)
                
            }
            Button(action: {
                self.round.choiceSelected = 3
                self.round.selectAns()
                
            }) {
                Text(round.displayAns[3]).padding(.all)
                
            }
        }
        .background(Color(hue: 1.0, saturation: 0.022, brightness: 0.811))
    }
}

struct QuestionScreen_Previews: PreviewProvider {
    static let game = Game()
    static let round = Round(p1: game.player1, p2: game.player2, r: game.roundNum)
    static var previews: some View {
        QuestionScreen().environmentObject(round)
    }
}
