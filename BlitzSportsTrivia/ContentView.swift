//
//  ContentView.swift
//  BlitzSportsTrivia
//
//  Created by Brendon Malouf on 2/17/20.
//  Copyright © 2020 Brendon Malouf. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var game: Game
    var body: some View {
        //Text("Hello, World!")
        //MainScreen()
        QuestionScreen()
    }
}

struct ContentView_Previews: PreviewProvider {
    static let game = Game()
    static var previews: some View {
        ContentView().environmentObject(game)
        //ContentView()
    }
}
