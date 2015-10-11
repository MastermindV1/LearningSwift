//
//  MoTableViewController.swift
//  SwiftLearning
//
//  Created by Basement on 10/8/15.
//  Copyright © 2015 Mohanad. All rights reserved.
//

import UIKit

class MoTableViewController : UITableViewController{
    // Here we declare that objectArray will contain dictionary elements (i.e
    // associative arrays
    var objectArray:[[String:AnyObject]] = []
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.navigationItem.title = "Alphabet!"
        self.navigationItem.rightBarButtonItems! = [self.editButtonItem(), UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: "addItem:")]
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objectArray.count
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
//        self.tableView.setEditing(editing, animated: animated)
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: MoTableCell = self.tableView.dequeueReusableCellWithIdentifier("MoTableCell") as! MoTableCell
        cell.colorView.backgroundColor! = objectArray[indexPath.row]["color"] as! UIColor
        cell.letterLabel.text = objectArray[indexPath.row]["letter"] as? String
        
        return cell
    }
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == UITableViewCellEditingStyle.Delete){
            objectArray.removeAtIndex(indexPath.row)
            self.tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Bottom)
        }
    }
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let element = objectArray.removeAtIndex(sourceIndexPath.row)
        objectArray.insert(element, atIndex: destinationIndexPath.row)
        self.tableView.moveRowAtIndexPath(sourceIndexPath, toIndexPath: destinationIndexPath)
    }
    
    
    let alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz" as NSString
    @IBAction func addItem(sender: AnyObject) {
        //let array = alphabet.componentsSeparatedByString(",")
        let randColor: UIColor = UIColor(hue: CGFloat(drand48()), saturation: CGFloat(1.0), brightness: CGFloat(1.0), alpha: CGFloat(1.0))
        
        let randomIndex = arc4random_uniform(UInt32(alphabet.length))
        let randomLetter =  alphabet.characterAtIndex(Int(randomIndex))
        let randomString =  NSString(characters:[randomLetter], length:1)
        var dict = [String: AnyObject]()
        dict["color"] = randColor
        dict["letter"] = "\(randomString)"
        print(randomString)
        objectArray.append(dict)
        self.tableView.reloadData()
    }
}