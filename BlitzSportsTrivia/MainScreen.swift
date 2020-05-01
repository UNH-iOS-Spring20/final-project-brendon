//
//  MainScreen.swift
//  BlitzSportsTrivia
//
//  Created by B Malouf on 3/3/20.
//  Copyright © 2020 Brendon Malouf. All rights reserved.
//

import SwiftUI

struct MainScreen: View {
    //@EnvironmentObject var game:Game
    @EnvironmentObject var screen: ScreenController
    var body: some View {
        ZStack{
            //Color.black  //sets Background color to black
            
            VStack{
                HeaderView() //A call to the default Logo header
                Button(action: {}) { //MyStats button
                    Text("MyStats")
                        .font(.headline).foregroundColor(Color.white).padding(10)
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) { //View Leaderboards button
                    Text("View Leaderboards")
                        .font(.headline).foregroundColor(Color.white).padding(10)
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) { //Challenge Friend button
                    Text("Challenge Friend")
                        .font(.headline).foregroundColor(Color.white).padding(10)
                }
                Button(action: {self.screen.sWScreenButton()}) { //play vs cpu button
                    Text("Play vs CPU")
                        .font(.headline).foregroundColor(Color.white).padding(10)
                }
                Button(action: {}) { //Settings button
                    Text("Settings")
                        .font(.headline).foregroundColor(Color.white).padding(10)
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) { // Frequently Asked Questions button
                    Text("FAQ")
                        .font(.headline).foregroundColor(Color.white).padding(10)
                }
                
                Image("HelmetCatch").resizable().frame(width:375,height:305)
                    //Pulls up an image of Kobe
                
                Spacer() //Pushes the VStack to the top of the screen
            }
            .padding()
            .frame(width: nil)
        }
        .background(/*@START_MENU_TOKEN@*/Color(hue: 0.008, saturation: 0.944, brightness: 0.476)/*@END_MENU_TOKEN@*/)
    }
}

struct MainScreen_Previews: PreviewProvider {
    static let screen = ScreenController()
    static var previews: some View {
        MainScreen().environmentObject(screen)
    }
}
