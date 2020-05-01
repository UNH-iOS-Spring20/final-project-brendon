
//  QuestionScreen.swift
//  BlitzSportsTrivia
//
//  Created by B Malouf on 3/16/20.
//  Copyright © 2020 Brendon Malouf. All rights reserved.
//

import SwiftUI

struct QuestionScreen: View {
    @EnvironmentObject var round: Round//allows for the use of round data
    @EnvironmentObject var screen:ScreenController
    
    var body: some View {
        ZStack{
            VStack(){
                Text("Round Score: \(round.roundScore)").foregroundColor(Color.gray)
                Text("Current streak: \(round.answerStreak)").foregroundColor(Color.gray)
                Text(round.questArr[round.qIndex]).padding(.all).font(.headline).foregroundColor(Color(hue: 0.129, saturation: 0.897, brightness: 0.954))
                
                Button(action: {
                    self.round.choiceSelected = 0
                    self.round.selectAns()
                    if self.round.roundContinue == false{
                        self.screen.eRScreenButton()//switches screen to end round screen
                    }
                }) {
                    Text(round.displayAns[0]).padding(.all).font(.headline).foregroundColor(Color.white)
                    
                }
                Button(action: {
                    self.round.choiceSelected = 1
                    self.round.selectAns()
                    if self.round.roundContinue == false{
                        self.screen.eRScreenButton()//switches screen to end round screen
                    }
                }) {
                    Text(round.displayAns[1]).padding(.all).font(.headline).foregroundColor(Color.white)
                    
                }
                Button(action: {
                    self.round.choiceSelected = 2
                    self.round.selectAns()
                    if self.round.roundContinue == false{
                        self.screen.eRScreenButton()//switches screen to end round screen
                    }
                }) {
                    Text(round.displayAns[2]).padding(.all).font(.headline).foregroundColor(Color.white)
                    
                }
                Button(action: {
                    self.round.choiceSelected = 3
                    self.round.selectAns()
                    if self.round.roundContinue == false{
                        self.screen.eRScreenButton()//switches screen to end round screen
                    }
                    
                }) {
                    Text(round.displayAns[3]).padding(.all).font(.headline).foregroundColor(Color.white)
                    
                }
            }.padding()
        }.background(/*@START_MENU_TOKEN@*/Color(hue: 0.008, saturation: 0.944, brightness: 0.476)/*@END_MENU_TOKEN@*/)
    }
}

struct QuestionScreen_Previews: PreviewProvider {
    static let game = Game()
    static let round = Round(p1: game.player1, p2: game.player2, r: game.roundNum)
    static var previews: some View {
        QuestionScreen().environmentObject(round)
    }
}
