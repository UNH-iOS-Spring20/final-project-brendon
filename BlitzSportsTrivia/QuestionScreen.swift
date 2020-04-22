
//  QuestionScreen.swift
//  BlitzSportsTrivia
//
//  Created by B Malouf on 3/16/20.
//  Copyright © 2020 Brendon Malouf. All rights reserved.
//

import SwiftUI

struct QuestionScreen: View {
    @EnvironmentObject var game: Game //allows for the use of round data
    
    var body: some View {
        VStack(){
            Text("QIndex: \(game.round.qIndex)")
            Text(game.round.questArr[game.round.qIndex]).padding(.all)
            
            Button(action: {
                self.game.round.choiceSelected = 0
                self.game.round.selectAns()
                
            }) {
                Text(game.round.displayAns[0]).padding(.all)
                
            }
            Button(action: {
                self.game.round.choiceSelected = 1
                self.game.round.selectAns()
            }) {
                Text(game.round.displayAns[1]).padding(.all)
                
            }
            Button(action: {
                self.game.round.choiceSelected = 2
                self.game.round.selectAns()
            }) {
                Text(game.round.displayAns[2]).padding(.all)
                
            }
            Button(action: {
                self.game.round.choiceSelected = 3
                self.game.round.selectAns()
                
            }) {
                Text(game.round.displayAns[3]).padding(.all)
                
            }
        }
        .background(Color(hue: 1.0, saturation: 0.022, brightness: 0.811))
    }
}

struct QuestionScreen_Previews: PreviewProvider {
    static let game = Game()
    static var previews: some View {
        QuestionScreen().environmentObject(game)
    }
}
