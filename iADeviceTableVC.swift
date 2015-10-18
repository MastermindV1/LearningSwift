//
//  iADeviceTableVC.swift
//  SwiftLearning
//
//  Created by Mastermind on 10/17/15.
//  Copyright © 2015 Mohanad. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class iADeviceTableVC: UITableViewController {
    
    let captureSession = AVCaptureSession()
    
    // If we find a device we'll store it here for later use
    var captureDevice : AVCaptureDevice?
    
    var devices: [String] = [];
    
    override func viewDidLoad() {
        super.viewDidLoad();
        
        captureSession.sessionPreset = AVCaptureSessionPresetLow
        
        
        let allDevices = AVCaptureDevice.devices();
        var deviceCount = devices.count;
        
        for device in allDevices{
            
            devices.insert(device as! String,atIndex: deviceCount++);
        }
        
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return devices.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("customcell",forIndexPath: indexPath) 
        cell.textLabel?.text = devices[indexPath.item]
        return cell
    }
}