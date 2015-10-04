//
//  ClosureViewController.swift
//  SwiftLearning
//
//  Created by Basement on 9/23/15.
//  Copyright (c) 2015 Mohanad. All rights reserved.
//

import UIKit

class ClosureViewController : UIViewController{
    // 'let' defines a constant
    var x = ["way", "down", "to", "kokomo"]
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
        
        // a closure/lambda
        let sorted: [String] = x.sort({ (string1: String, string2: String) -> Bool in
            return string1 > string2
        })
        
        // Optional values are defined with the ? and mean that it can exist or not
        var a: Int?
        a = 0
        // Acess an optional's value with !
        print(a!)
        
        
        print(x)
        print(sorted)
    }
}
