//
//  CommentViewCell.swift
//  YY
//
//  Created by 罗阅 on 11/8/14.
//
//

import Foundation

import UIKit

import AudioToolbox

class CommentViewCell: UITableViewCell {
    //override init(UITableViewCellStyleDefault,nil)

    init(style: UITableViewCellStyle, reuseIdentifier: String?, backgroundImageFile: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       backgroundImage = UIImageView(image: UIImage(contentsOfFile: backgroundImageFile!))
    }
    required init(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
    
    
    

    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBAction func PlaySound(sender: AnyObject) { //play sound code goes here
    }

}
