//
//  WheelController.swift
//  BlitzSportsTrivia
//
//  Created by Josh D. Henry 
//  Edited by B Malouf on 4/21/20.
//  Copyright © 2020 Brendon Malouf. All rights reserved.
//

import SwiftUI
import SpinWheelControl

class WheelController: UIViewController, ObservableObject, SpinWheelControlDataSource, SpinWheelControlDelegate{

    @Published var categorySelected:String = ""
    let gold:UIColor = UIColor(red: 252.0/255.0, green: 194.0/255.0, blue: 0, alpha: 1.0) //Custom made gold color for the wheel

    
    let colorPalette: [UIColor] = [UIColor.blue, UIColor.brown, UIColor.cyan, UIColor.darkGray, UIColor.green, UIColor.magenta, UIColor.red, UIColor.orange, UIColor.black, UIColor.gray, UIColor.lightGray, UIColor.purple, UIColor.yellow, UIColor.white] // colors for UIVIew

    let categoryNames: [String] = ["All NBA", "All NFL", "All MLB", "Pros in College (NBA)", "Pros in College (NFL)"] //category names that will go on the wheel
    
    func wedgeForSliceAtIndex(index: UInt) -> SpinWheelWedge {
        let wedge = SpinWheelWedge()
        
        //wedge.shape.fillColor = colorPalette[12].cgColor
        wedge.shape.fillColor = gold.cgColor
        wedge.label.text = categoryNames[Int(index)]
        
        return wedge
    } //gives each wedge a category name and makes the wedge gold

    
    var spinWheelControl:SpinWheelControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let buttonX = 150 //x-coordinate of button
        let buttonY = 375 //y-coordinate of button
        let buttonWidth = 100
        let buttonHeight = 50
        
        let button = UIButton(type: .system)
        button.setTitle("Spin Wheel", for: .normal) //initializes "Spin Wheel" Button
        button.tintColor = .white
        button.backgroundColor = .red
       
        button.frame = CGRect(x: buttonX, y: buttonY, width: buttonWidth, height: buttonHeight) //sets the button frame
        
        button.addTarget(self, action:#selector(self.buttonClicked), for: .touchUpInside) // handles the button action
        
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.width) //creates the frame for the Wheel
        spinWheelControl = SpinWheelControl(frame: frame, snapOrientation: .right, wedgeLabelOrientation: WedgeLabelOrientation.inOut) //initializes the wheel
        
        spinWheelControl.addTarget(self, action: #selector(spinWheelDidChangeValue), for: UIControl.Event.valueChanged) //Adds a target for the valueChanged event

        //Give the SpinWheelControl a data source:
        spinWheelControl.dataSource = self
        spinWheelControl.reloadData()
        
        //Set the SpinWheelControl's delegate:
        spinWheelControl.delegate = self
        
        self.view.addSubview(spinWheelControl) //adds wheel to view
        self.view.addSubview(button) //adds the button to view
    }
    
    //spins the wheel when button is pressed
    @objc func buttonClicked() {
        spinWheel()
    }
    
    //sets the number of wedges
    func numberOfWedgesInSpinWheel(spinWheel: SpinWheelControl) -> UInt {
        return 5
    }
    
    
    //Target was added in viewDidLoad for the valueChanged UIControlEvent
    @objc func spinWheelDidChangeValue(sender: AnyObject) {
        self.categorySelected = categoryNames[self.spinWheelControl.selectedIndex]
        //print("Value changed to " + categoryNames[self.spinWheelControl.selectedIndex])
        
        print("Value changed to " + categorySelected)
        //used to print the category selected to the WheelScreen
        
    }
    
    func resetCategorySelected(){
        categorySelected = ""
    }
    
    func spinWheelDidEndDecelerating(spinWheel: SpinWheelControl) {
        print("The spin wheel did end decelerating.")
    }
    
    //prints the number of radians the wheel rotated
    func spinWheelDidRotateByRadians(radians: Radians) {
        print("The wheel did rotate this many radians - " + String(describing: radians))
    }
    
    //spins the wheel
    func spinWheel(){
        spinWheelControl.randomSpin()
    }
}

