///Users/bmalouf/Documents/cs4556/BlitzSportsTrivia/BlitzSportsTrivia/Model/Round.swift
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
        ZStack{
            VStack(){
                Text(game.round.questArr[18]).padding(.all)
                
                Button(action: {}) {
                    Text(game.round.corrAnsArr[18]).padding(.all)
                    
                }
                Button(action: {}) {
                    Text(game.round.wrong1Arr[18]).padding(.all)
                    
                }
                Button(action: {}) {
                    Text(game.round.wrong2Arr[18]).padding(.all)
                    
                }
                Button(action: {}) {
                    Text(game.round.wrong3Arr[18]).padding(.all)
                    
                }
            }
        }
        //.background(Color(hue: 1.0, saturation: 0.022, brightness: 0.811))
        
    }
}

struct QuestionScreen_Previews: PreviewProvider {
    static let game = Game()
    static var previews: some View {
        QuestionScreen().environmentObject(game)
    }
}
