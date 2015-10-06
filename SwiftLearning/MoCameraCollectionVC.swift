//
//  MoCameraCollectionVC.swift
//  SwiftLearning
//
//  Created by Basement on 10/4/15.
//  Copyright © 2015 Mohanad. All rights reserved.
//

import UIKit
// Here we will inherit from a protocol, protocols are the equivalent of java's interfaces except
// that you can have non-optional methods/actions in protocols. We inherit these specifically because the image picker needs them
class MoCameraCollectionVC : UICollectionViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
   
    required init!(coder: NSCoder){
        super.init(coder: coder)
    }
    
    @IBAction func takePicture(sender: AnyObject) {
        showCamera();
    }
//  This is a helper method to display a image picker
    func showCamera(){
//      A image picker is a view\ that allows a user to choose an image to use
        let imagePickerController:UIImagePickerController = UIImagePickerController()
//      In order for us to receive the image, we must declare that we are the image picker's delegate
//      meaning that we will handle the methods that it calls
        imagePickerController.delegate = self
        
        var sourceType: UIImagePickerControllerSourceType
        // If the camera is there then use it, else use the photo library
        if(UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera)){
            sourceType = UIImagePickerControllerSourceType.Camera
        }else{
            sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        }
        imagePickerController.sourceType = sourceType

        self.presentViewController(imagePickerController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
//         Because we register the cell in the Storyboard there is no need for us to register again
        /*self.collectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "ImageCollectionViewCell")*/
    }
    // Number of sections, here we only have 1
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    // The cells will depend upon the number of pictures in the picture Array
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return PictureStore.sharedInstance.picArray.count
    }
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//      Load the array of the addresses
        let picArray = PictureStore.sharedInstance.picArray
//      Get cell from the deque
        let cell: CollectionViewCell = self.collectionView!.dequeueReusableCellWithReuseIdentifier("ImageCollectionViewCell", forIndexPath: indexPath) as! CollectionViewCell
//      Load the image into the imageView
        cell.imageView.image = PictureStore.sharedInstance.getPicture(picArray[indexPath.row])
        
        return cell
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        picker.dismissViewControllerAnimated(true, completion: {
            // Add the picture to the store
            if(info.count > 0){

                let image: UIImage = info[UIImagePickerControllerOriginalImage] as! UIImage
                
                
                PictureStore.sharedInstance.addPicture(image)
            }
            // Refresh the collection view to retrieve the picture
            self.collectionView!.reloadData()        
        })

    }
    
    
}
