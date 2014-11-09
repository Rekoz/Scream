//
//  MainCell.swift
//  YY
//
//  Created by Qikun Guo on 11/8/14.
//
//

import Foundation
import UIKit
import AVFoundation

class MainCell: UICollectionViewCell {
    var photo: Photo!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var playButton: UIButton!
    
    init(photo: Photo) {
        super.init()
        image.image = UIImage(data: photo.photo)
    }

    @IBAction func touchPlay(sender: AnyObject) {
        var mySpeechSynthesizer:AVSpeechSynthesizer = AVSpeechSynthesizer()
        var mySpeechUtterance:AVSpeechUtterance = AVSpeechUtterance(string: photo.voice)
        mySpeechUtterance.pitchMultiplier = photo.pitch.floatValue
        mySpeechSynthesizer.speakUtterance(mySpeechUtterance)
    }
    
    required init(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
}