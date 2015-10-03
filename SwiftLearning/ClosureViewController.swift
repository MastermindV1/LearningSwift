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
        _ = x.sort({ (string1: String, string2: String) -> Bool in
            return string1 > string2
        })
        
        
    }

}
