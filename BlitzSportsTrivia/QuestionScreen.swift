
//  QuestionScreen.swift
//  BlitzSportsTrivia
//
//  Created by B Malouf on 3/16/20.
//  Copyright © 2020 Brendon Malouf. All rights reserved.
//

import SwiftUI

struct QuestionScreen: View {
    @EnvironmentObject var game: Game
    @EnvironmentObject var round: Round//allows for the use of round data
    @EnvironmentObject var screen:ScreenController
    
    var body: some View {
        VStack(spacing: 25){
                HStack{
                    Spacer()
                }
            Text("Round \(round.r)")
                .font(.largeTitle)
            HStack{
                Text("Score: \(round.roundScore)").foregroundColor(Color.green)
                Text("Streak: \(round.answerStreak)").foregroundColor(Color.green)
                Text("Strikes: \(round.strikes)").foregroundColor(Color.red)
            }
            if self.round.blitzAvail == true{
                Button(action: {
                    self.round.blitzOn = true
                    self.round.blitzAvail = false
                }) {
                    Text("BLITZ!").padding(.all).font(.headline).foregroundColor(.red).background(Color.white).overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.red, lineWidth: 5)
                    )
                }
            }
                
            Text(round.questArr[round.qIndex]).padding(.all).font(.headline).foregroundColor(.black).background(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/).overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.blue, lineWidth: 5)
            )
                Button(action: {
                    self.round.choiceSelected = 0
                    self.round.selectAns()
                    if self.round.roundContinue == false{
                        self.screen.eRScreenButton()//switches screen to end round screen
                    }
                    if self.round.gameOver == true{
                        self.game.endGame(result: self.round.gameResult)
                        self.screen.eGButton()//switches screen to end game
                    }
                }) {
                    Text(round.displayAns[0]).fixedSize(horizontal: true, vertical: true).padding(.all).font(.headline).foregroundColor(Color.black).frame(width: 200.0, height: 75.0).background(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/).overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.blue, lineWidth: 5)
                    )
                    
                }
                Button(action: {
                    self.round.choiceSelected = 1
                    self.round.selectAns()
                    if self.round.roundContinue == false{
                        self.screen.eRScreenButton()//switches screen to end round screen
                    }
                    if self.round.gameOver == true{
                        self.game.endGame(result: self.round.gameResult)
                        self.screen.eGButton()//switches screen to end game
                    }
                }) {
                    Text(round.displayAns[1]).fixedSize(horizontal: true, vertical: true).padding(.all).font(.headline).foregroundColor(Color.black).frame(width: 200.0, height: 75.0).background(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/).overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.blue, lineWidth: 5)
                    )
                    
                }
                Button(action: {
                    self.round.choiceSelected = 2
                    self.round.selectAns()
                    if self.round.roundContinue == false{
                        self.screen.eRScreenButton()//switches screen to end round screen
                    }
                    if self.round.gameOver == true{
                        self.game.endGame(result: self.round.gameResult)
                        self.screen.eGButton()//switches screen to end game
                    }
                }) {
                    Text(round.displayAns[2]).fixedSize(horizontal: true, vertical: true).padding(.all).font(.headline).foregroundColor(Color.black).frame(width: 200.0, height: 75.0).background(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/).overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.blue, lineWidth: 5)
                    )
                    
                }
                Button(action: {
                    self.round.choiceSelected = 3
                    self.round.selectAns()
                    if self.round.roundContinue == false{
                        self.game.endGame(result: self.round.gameResult)
                        self.screen.eRScreenButton()//switches screen to end round screen
                    }
                    if self.round.gameOver == true{
                        
                        self.screen.eGButton()//switches screen to end game
                    }
                    
                }) {
                    Text(round.displayAns[3]).fixedSize(horizontal: true, vertical: true).padding(.all).font(.headline).foregroundColor(Color.black).frame(width: 200.0, height: 75.0).background(/*@START_MENU_TOKEN@*/Color.white/*@END_MENU_TOKEN@*/).overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.blue, lineWidth: 5)
                    )
                    
                }
                //Spacer()
        }.padding().background(Color.white)
    }
}

struct QuestionScreen_Previews: PreviewProvider {
    static let game = Game()
    static let round = Round(p1: game.player1, p2: game.player2, r: game.roundNum)
    static var previews: some View {
        QuestionScreen().environmentObject(round)
    }
}
