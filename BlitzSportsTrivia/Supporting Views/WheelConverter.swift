//
//  WheelConverter.swift
//  
//
//  Created by B Malouf on 4/21/20.
//

import SwiftUI
import UIKit

struct WheelControllerWrapper: UIViewControllerRepresentable {

    typealias UIViewControllerType = WheelController


    func makeUIViewController(context: UIViewControllerRepresentableContext<WheelControllerWrapper>) -> WheelControllerWrapper.UIViewControllerType {
        return WheelController()
    }

    func updateUIViewController(_ uiViewController: WheelControllerWrapper.UIViewControllerType, context: UIViewControllerRepresentableContext<WheelControllerWrapper>) {
        
    }
}

 
