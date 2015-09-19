//
//  SimpleStuffVC.swift
//  SwiftLearning
//
//  Created by Basement on 9/19/15.
//  Copyright (c) 2015 Mohanad. All rights reserved.
//

import UIKit
class SimpleStuffVC : UIViewController{
    // Constant for max fibonacci number
    var number = 1
    var nextNumber = 1
    
//  Declaring member variables and creating an array of ints
    var fiboArray = [Int]()
    
// Interface Builder Link to the label
    @IBOutlet weak var Label: UILabel!
// Interface Builder Link to the pressing action of the button
    @IBAction func btnPressed(sender: AnyObject) {
        fibonacci()
        self.Label.text = String(number)
    }
// Fibonacci Calculator
    func fibonacci(){
        var swap:Int = nextNumber
        nextNumber = number + nextNumber
        number = swap
    }
}