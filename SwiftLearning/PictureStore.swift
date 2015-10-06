//
//  PictureStore.swift
//  SwiftLearning
//
//  Created by Basement on 10/4/15.
//  Copyright © 2015 Mohanad. All rights reserved.
//

import Foundation
import UIKit
// A singleton class for storing addresses for pictures
class PictureStore{
    // The singleton instance of the class, access by PictureStore.sharedInstance
    static let sharedInstance: PictureStore = PictureStore()
    // The array that will hold the address of each picture
    var picArray: [String] = []
    
    // The constructor must be private for it to be a singleton
    private init(){
        
        let filemanager: NSFileManager = NSFileManager.defaultManager()
        let path = imagePathForKey("pictures")
        // If the pictures file exists then initialize the array with it
        if(filemanager.fileExistsAtPath(path)){
           picArray = NSKeyedUnarchiver.unarchiveObjectWithData(filemanager.contentsAtPath(path)!) as! [String]
        }else{
         picArray = []
        }
    }
    
    // Saves the picture addresses to the filesystem
    func saveContents(){
        let filemanager = NSFileManager.defaultManager()
        let path = imagePathForKey("pictures")
        filemanager.createFileAtPath(path, contents: NSKeyedArchiver.archivedDataWithRootObject(picArray), attributes: nil)
    }
    // This method will give you a path for the image to be placed in
    func imagePathForKey(key: String) -> String{

        let documentsDirectory: NSString = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0]
        
        let path: String = documentsDirectory.stringByAppendingPathComponent(key);
        return path
    }
    
    // Adds picture to the picArray, and saves the picture to file
    func addPicture(picture: UIImage) -> String{
        let uuid = NSUUID()
        let filemanager = NSFileManager.defaultManager()
        let path = imagePathForKey(uuid.UUIDString)
        filemanager.createFileAtPath(path, contents: UIImageJPEGRepresentation(picture, 0.3), attributes: nil)
        picArray.append(uuid.UUIDString)
        return uuid.UUIDString
    }
    
    // Returns a UIImage from a uuid key
    func getPicture(key: String) -> UIImage{
        let path = imagePathForKey(key)
        let filemanager = NSFileManager.defaultManager()
        let image: UIImage = UIImage(data: filemanager.contentsAtPath(path)!)!
        return image
    }
}
