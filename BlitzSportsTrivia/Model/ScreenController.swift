//
//  ScreenController.swift
//  BlitzSportsTrivia
//
//  Created by B Malouf on 4/29/20.
//  Copyright © 2020 Brendon Malouf. All rights reserved.
//

import SwiftUI

class ScreenController: ObservableObject {
     @Published var screen:String //used to determine which screen should be showing
    
    init() {
        screen = "MainScreen" //sets the initial screen to Main screen
    }
    
    
    func sWScreenButton(){
        //mainscreen playCPU button
        self.screen = "SpinWheel"
    }
    
    func eRScreenButton(){
        self.screen = "EndRound"
    }
    
    func mSButton(){
        self.screen = "MainScreen"
    }
    func qSButton(){
        self.screen = "QuestionScreen"
    }
    
}
