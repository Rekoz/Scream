//
//  Photo.swift
//  YY
//
//  Created by Qikun Guo on 11/8/14.
//
//

import Foundation
import CoreData

class Photo: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var photo: NSData
    @NSManaged var voice: String
    @NSManaged var pitch: NSNumber
    @NSManaged var hit: NSNumber
    @NSManaged var createdDate: NSDate
    @NSManaged var locationX: NSNumber
    @NSManaged var locationY: NSNumber
    
    class func createInManagedObjectContext(moc: NSManagedObjectContext, name: String, photo: NSData, voice: String, pitch: NSNumber, locationX: NSNumber, locationY: NSNumber ) -> Photo {
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("Photo", inManagedObjectContext: moc) as Photo
        newItem.name = name
        newItem.locationX = locationX
        newItem.locationY = locationY
        newItem.photo = photo
        newItem.voice = voice
        newItem.pitch = pitch
        return newItem
    }
}
