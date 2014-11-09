//
//  DataGenerator.swift
//  YY
//
//  Created by Rekoz on 11/8/14.
//
//

import Foundation
import UIKit
import CoreData

class DataGenerator: NSObject {
    class func generate(moc: NSManagedObjectContext) {
        //UIImage(contentsOfFile: "")
        for i in 0...20 {
            //Photo.createInManagedObjectContext(moc, name: "123", photo: UIImagePNGRepresentation(UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("IMG_2165", ofType: "JPG"))), voice: "Hello", pitch: 100, locationX: NSNumber(unsignedInt: arc4random(100)), locationY: 2)
            Photo.createInManagedObjectContext(moc, name: "nothing much", photo: UIImageJPEGRepresentation(UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("IMG_3300", ofType: "JPG")!), 0.1), voice: "I REALLY don't know what to say here", pitch: 100, locationX: NSNumber(unsignedInt: arc4random()), locationY: 3)
            Photo.createInManagedObjectContext(moc, name: "nothing much", photo: UIImageJPEGRepresentation(UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("IMG_3467", ofType: "JPG")!), 0.1), voice: "I REALLY don't know what to say here", pitch: 100, locationX: NSNumber(unsignedInt: arc4random()), locationY: 3)
            Photo.createInManagedObjectContext(moc, name: "nothing much", photo: UIImageJPEGRepresentation(UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("IMG_3469", ofType: "JPG")!), 0.1), voice: "I REALLY don't know what to say here", pitch: 100, locationX: NSNumber(unsignedInt: arc4random()), locationY: 3)
            Photo.createInManagedObjectContext(moc, name: "nothing much", photo: UIImageJPEGRepresentation(UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("IMG_3474", ofType: "JPG")!), 0.1), voice: "I REALLY don't know what to say here", pitch: 100, locationX: NSNumber(unsignedInt: arc4random()), locationY: 3)
            Photo.createInManagedObjectContext(moc, name: "nothing much", photo: UIImageJPEGRepresentation(UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("IMG_3485", ofType: "JPG")!), 0.1), voice: "I REALLY don't know what to say here", pitch: 100, locationX: NSNumber(unsignedInt: arc4random()), locationY: 3)
            Photo.createInManagedObjectContext(moc, name: "nothing much", photo: UIImageJPEGRepresentation(UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("IMG_2373", ofType: "JPG")!), 0.1), voice: "I REALLY don't know what to say here", pitch: 100, locationX: NSNumber(unsignedInt: arc4random()), locationY: 3)
            Photo.createInManagedObjectContext(moc, name: "nothing much", photo: UIImageJPEGRepresentation(UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("IMG_2376", ofType: "JPG")!), 0.1), voice: "I REALLY don't know what to say here", pitch: 100, locationX: NSNumber(unsignedInt: arc4random()), locationY: 3)
            Photo.createInManagedObjectContext(moc, name: "nothing much", photo: UIImageJPEGRepresentation(UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("IMG_2377", ofType: "JPG")!), 0.1), voice: "I REALLY don't know what to say here", pitch: 100, locationX: NSNumber(unsignedInt: arc4random()), locationY: 3)
        }
        
    }
}
