//
//  MainScreen.swift
//  BlitzSportsTrivia
//
//  Created by B Malouf on 3/3/20.
//  Copyright © 2020 Brendon Malouf. All rights reserved.
//

import SwiftUI

struct MainScreen: View {
    var body: some View {
        ZStack{
            Color.black //sets Background color to black
            VStack{
                HeaderView() //A call to the default Logo header
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) { //MyStats button
                    Text("MyStats")
                        .font(.headline).foregroundColor(Color.blue).padding(10)
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) { //View Leaderboards button
                    Text("View Leaderboards")
                        .font(.headline).foregroundColor(Color.blue).padding(10)
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) { //Challenge Friend button
                    Text("Challenge Friend")
                        .font(.headline).foregroundColor(Color.blue).padding(10)
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) { //Random opponent button
                    Text("Random Opponent")
                        .font(.headline).foregroundColor(Color.blue).padding(10)
                }
                Button(action: {}) { //Settings button
                    Text("Settings")
                        .font(.headline).padding(10)
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) { // Frequently Asked Questions button
                    Text("FAQ")
                        .font(.headline).padding(10)
                }
                
                Image("Kobe").resizable().frame(width:375,height:305)
                    //Pulls up an image of Kobe
                
                Spacer() //Pushes the VStack to the top of the screen
            }
            .padding()
            .frame(width: nil)
        }
    }
}

struct MainScreen_Previews: PreviewProvider {
    static var previews: some View {
        MainScreen()
    }
}
