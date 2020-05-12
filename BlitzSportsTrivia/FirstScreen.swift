//
//  FirstScreen.swift
//  BlitzSportsTrivia
//
//  Created by B Malouf on 5/11/20.
//  Copyright © 2020 Brendon Malouf. All rights reserved.
//

import SwiftUI

struct FirstScreen: View {
    @EnvironmentObject var screen:ScreenController
    var body: some View {
        VStack{
            Text("Welcome to Blitz Sports Trivia")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.yellow)
                .multilineTextAlignment(.center)
                .padding(.top,50)
            VStack{
                Button(action: {
                    self.screen.sIButton()
                }) {
                Text("Sign In")
                }.frame(width: 300,height: 50).foregroundColor(Color.black).background(Color.yellow).cornerRadius(10).padding(.top,40)
                Button(action: {
                    self.screen.sUButton()
                }) {
                Text("Sign Up")
                }.frame(width: 300,height: 50).foregroundColor(Color.black).background(Color.yellow).cornerRadius(10).padding(.top,20)
            }
            Spacer()
        }.background(Color.blue)
    }
}

struct FirstScreen_Previews: PreviewProvider {
    static var previews: some View {
        FirstScreen()
    }
}
