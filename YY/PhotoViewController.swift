//
//  PhotoViewController.swift
//  YY
//
//  Created by Qikun Guo on 11/8/14.
//
//

import Foundation
import UIKit

class PhotoViewController:UIViewController {

    @IBOutlet weak var img1: UIImageView!
    var photo:Photo = Photo()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        //fatalError("init(coder:) has not been implemented")
    }
    
    override init() {
        super.init()
    }
    
    
}

