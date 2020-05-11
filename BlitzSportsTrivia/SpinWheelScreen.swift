//
//  SpinWheelScreen.swift
//  BlitzSportsTrivia
//
//  Created by B Malouf on 4/22/20.
//  Copyright © 2020 Brendon Malouf. All rights reserved.
//

import SwiftUI

struct SpinWheelScreen: View {
    @EnvironmentObject var screen: ScreenController
    @EnvironmentObject var wheel:WheelController
   
    var catNames:[String] = ["All MLB", "Pros in College (NFL)", "All NFL", "Pros in College (NBA)", "All NBA"]

    var body: some View {
        VStack(spacing: 30){
            CategoryWheel()
            //Text("Category Selected: \(wheel.categorySelected)")
            
            Button(action: {
                self.screen.showCategory = true
            }) {
            Text("Category:")
            }
            if self.screen.showCategory == true{
                Text("\(self.catNames[self.screen.catIndex])")
                    .font(.headline)
            }
            Button(action: {
                self.screen.qSButton()
                self.wheel.resetCategorySelected()
                self.screen.showCategory = false
                if(self.screen.catIndex < 4){
                    self.screen.catIndex+=1
                }
            }) {
            Text("Continue")
            }.padding(.all).font(.headline).foregroundColor(.blue).background(Color.white).overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.blue, lineWidth: 3)
            )
                
            Spacer()
        }
    }
}

struct SpinWheelScreen_Previews: PreviewProvider {
    static let wheel = WheelController()
    static let screen = ScreenController()
    static var previews: some View {
        SpinWheelScreen().environmentObject(wheel).environmentObject(screen)
    }
}
