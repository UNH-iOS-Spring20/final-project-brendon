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
    @EnvironmentObject var wheel:WheelController
    let catArray:[String] = ["All NFL", "All NBA", "All MLB", "Pros in College (NFL)", "Pros in College (NBA)"]
    let index:Int = 0
    var body: some View {
        VStack(spacing: 25){
            WheelControllerWrapper().scaledToFit()
                .background(Color.gray)
        }
    }
    
    struct CategoryWheel_Previews: PreviewProvider {
        static let wheel = WheelController()
        static var previews: some View {
            CategoryWheel().environmentObject(wheel)
        }
    }
}
