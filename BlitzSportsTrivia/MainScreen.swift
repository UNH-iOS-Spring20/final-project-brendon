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
    @EnvironmentObject var core:Core
    @EnvironmentObject var screen: ScreenController
    var body: some View {
        ZStack{
            Color.blue //sets Background color to blue
            
            VStack{
                //HeaderView() //A call to the default Logo header
                Text("Blitz Sports Trivia")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.yellow)
                Button(action: {
                    if(self.core.signOut()){
                        self.screen.fSButton()
                    }
                    
                }) { //MyStats button
                    Text("Logout")
                        .frame(width: 100,height: 55).foregroundColor(Color.black).background(Color.yellow).cornerRadius(10).padding(.top,40)
                }


                Button(action: {}) { //MyStats button
                    Text("MyStats")
                        .frame(width: 250,height: 55).foregroundColor(Color.black).background(Color.yellow).cornerRadius(10).padding(.top,40)
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) { //View Leaderboards button
                    Text("View Leaderboards")
                        .frame(width: 250,height: 55).foregroundColor(Color.black).background(Color.yellow).cornerRadius(10).padding(.top,25)
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) { //Challenge Friend button
                    Text("Challenge Friend")
                        .frame(width: 250,height: 55).foregroundColor(Color.black).background(Color.yellow).cornerRadius(10).padding(.top,25)
                }
                Button(action: {self.screen.sWScreenButton()}) { //play vs cpu button
                    Text("Play vs CPU")
                        .frame(width: 250,height: 55).foregroundColor(Color.black).background(Color.yellow).cornerRadius(10).padding(.top,25)
                }
                Button(action: {}) { //Settings button
                    Text("Settings")
                        .frame(width: 250,height: 55).foregroundColor(Color.black).background(Color.yellow).cornerRadius(10).padding(.top,25)
                }
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) { // Frequently Asked Questions button
                    Text("FAQ")
                        .frame(width: 250,height: 55).foregroundColor(Color.black).background(Color.yellow).cornerRadius(10).padding(.top,25)
                }

                Spacer() //Pushes the VStack to the top of the screen
            }
            .padding()
            .frame(width: nil)
        }
        .background(Color.blue)
    }
}

struct MainScreen_Previews: PreviewProvider {
    static let screen = ScreenController()
    static var previews: some View {
        MainScreen().environmentObject(screen)
    }
}
