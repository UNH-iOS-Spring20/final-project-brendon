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
    var body: some View {
        VStack{
            CategoryWheel()
            Text("Category Selected: \(self.wheel.categorySelected)")
            
            Button(action: {
                self.screen.qSButton()
                self.wheel.resetCategorySelected()
            }) {
            Text("Continue")
            }
                
            Spacer()
        }
    }
}

struct SpinWheelScreen_Previews: PreviewProvider {
    static let wheel = WheelController()
    static var previews: some View {
        SpinWheelScreen().environmentObject(wheel)
    }
}
