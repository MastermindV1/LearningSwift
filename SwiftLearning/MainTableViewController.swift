//
//  MainTableViewController.swift
//  SwiftLearning
//
//  Created by Basement on 9/19/15.
//  Copyright (c) 2015 Mohanad. All rights reserved.
//

import UIKit
class MainTableViewController : UITableViewController{
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let index:Int = indexPath.row
        switch(index){
        case 0:
            let ismael: UIStoryboard = UIStoryboard.init(name: "Ismael", bundle: nil)
            let destination: UIViewController = ismael.instantiateInitialViewController()!
            self.navigationController!.pushViewController(destination, animated: true)
            
        case 1:
            let mohanad: UIStoryboard = UIStoryboard.init(name: "Mohanad", bundle: nil)
            let destination: UIViewController = mohanad.instantiateInitialViewController()!
            self.navigationController!.pushViewController(destination, animated: true)
            /*
            let segue: UIStoryboardSegue = UIStoryboardSegue.init(identifier: "identifier", source: self, destination: destination, performHandler: { () -> Void in
                self.navigationController!.pushViewController(destination, animated: true)
            })
            let cell:UITableViewCell = self.tableView.cellForRowAtIndexPath(indexPath)!
            self.shouldPerformSegueWithIdentifier(segue.identifier!, sender: cell)
            self.prepareForSegue(segue, sender: cell)
            segue.perform()
            */
        
        
        case 2:
            let firass: UIStoryboard = UIStoryboard.init(name: "Firass", bundle: nil)
            let destination: UIViewController = firass.instantiateInitialViewController()!
            self.navigationController!.pushViewController(destination, animated: true)
        default:
            NSLog("Something happened")
        }
    }
    
}
