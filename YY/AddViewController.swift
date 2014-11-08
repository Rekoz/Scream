//
//  AddViewController.swift
//  YY
//
//  Created by He Jiang on 11/8/14.
//
//

import UIKit

class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var imagePickerController = UIImagePickerController()
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!) {
        let selectedImage : UIImage = image
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        imagePickerController.delegate = self
        imagePickerController.sourceType = .SavedPhotosAlbum
        imagePickerController.allowsEditing = true
        self.presentViewController(imagePickerController, animated: true, completion: { imageP in
            
        })
    }
    
}
