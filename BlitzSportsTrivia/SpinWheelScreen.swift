//
//  SpinWheelScreen.swift
//  BlitzSportsTrivia
//
//  Created by B Malouf on 4/22/20.
//  Copyright © 2020 Brendon Malouf. All rights reserved.
//

import SwiftUI

struct SpinWheelScreen: View {
    var wheel = WheelController()
    var body: some View {
        VStack{
            CategoryWheel()
            Spacer()
        }
    }
}

struct SpinWheelScreen_Previews: PreviewProvider {
    static var previews: some View {
        SpinWheelScreen()
    }
}
