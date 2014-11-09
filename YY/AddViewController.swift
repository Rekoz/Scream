//
//  AddViewController.swift
//  YY
//
//  Created by He Jiang on 11/8/14.
//
//

import UIKit
import AVFoundation

class AddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    // put a line
    var imagePickerController = UIImagePickerController()
    @IBOutlet weak var pitchSlider: UISlider!
    @IBOutlet weak var textInput: UITextField!
    @IBOutlet weak var pitchValueLabel: UILabel!
    @IBOutlet weak var scheduleTime: UIPickerView!
    let pickerData = ["after 1 min", "after 5 min", "after 15 min", "after 30 min", "after 1 h", "after 8 h", "after 1 day", "after 1 week"]
    
    // properties
    /*override init()
    {
        super.init()
    }*/
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        imagePickerController.delegate = self
        imagePickerController.sourceType = .SavedPhotosAlbum
        imagePickerController.allowsEditing = true
        self.presentViewController(imagePickerController, animated: true, completion: { imageP in
            
        })
    }
    
    // initializers
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!) {
        let selectedImage : UIImage = image
    }
    
    @IBAction func addSubmit(sender: AnyObject) {
        var pitchValue = pitchSlider.value
        var mySpeechSynthesizer:AVSpeechSynthesizer = AVSpeechSynthesizer()
        var mySpeechUtterance:AVSpeechUtterance = AVSpeechUtterance()
        mySpeechUtterance.pitchMultiplier = pitchValue
        mySpeechSynthesizer.speakUtterance(mySpeechUtterance)
    }
    
    @IBAction func pitchSliderValueChanged(sender: AnyObject) {
        var pitchValue = pitchSlider.value
        pitchValueLabel.text = "\(Int(pitchValue))%"
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickerData[row]
    }
    
    override func viewDidLoad() {
        self.navigationItem.title = "Add your scream"
        var bbi = UIBarButtonItem(title: "Send", style: UIBarButtonItemStyle.Done, target: self, action: Selector("returnToPrevious"))
        self.navigationItem.rightBarButtonItem = bbi
            //UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Play, target: self, action: Selector("addSubmit"))
    }
    // methods
    
    func returnToPrevious() {
        self.navigationController?.popViewControllerAnimated(true)
    }
}