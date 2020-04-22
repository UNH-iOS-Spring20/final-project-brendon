//
//  CategoryWheel.swift
//  BlitzSportsTrivia
//
//  Created by B Malouf on 3/15/20.
//  Copyright © 2020 Brendon Malouf. All rights reserved.
//

import SwiftUI
import UIKit

struct CategoryWheel: View{
    //var wheel:WheelController
    
    var body: some View {
        WheelControllerWrapper().scaledToFit()
                .background(/*@START_MENU_TOKEN@*/Color(hue: 0.008, saturation: 0.944, brightness: 0.476)/*@END_MENU_TOKEN@*/)
    }
}

struct CategoryWheel_Previews: PreviewProvider {
    //static let wheel = WheelController()
    static var previews: some View {
        CategoryWheel()
    }
}
