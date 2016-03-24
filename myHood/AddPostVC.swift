//
//  AddPostVC.swift
//  myHood
//
//  Created by Jorge Luis Perales on 24/03/16.
//  Copyright © 2016 Jorge Luis Perales. All rights reserved.
//

import UIKit

class AddPostVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var postImage: UIImageView!
    @IBOutlet var titleField: UITextField!
    @IBOutlet var descField: UITextField!
    
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        postImage.layer.cornerRadius = postImage.frame.size.width / 2
        postImage.clipsToBounds = true
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
    }

    @IBAction func addPicButtonPressed(sender: UIButton) {
        sender.setTitle("", forState: .Normal)
        presentViewController(imagePicker, animated: true, completion: nil)
    }

    @IBAction func makePostButtonPressed(sender: AnyObject) {
        if let title = titleField.text, let desc = descField.text, let img = postImage.image {
            
            let imgPath = DataService.instance.saveImageAndCreatePath(img)
            
            let post = Post(imagePath: imgPath, title: title, description: desc)
            DataService.instance.addPost(post)
            dismissViewControllerAnimated(true, completion: nil)
        }
    }

    @IBAction func cancelButtonPressed(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage, editingInfo: [String : AnyObject]?) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
        postImage.image = image
        
        
    }
}
