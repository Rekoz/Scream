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
    @NSManaged var photoName: String
    @NSManaged var voice: NSData
    @NSManaged var hit: NSNumber
    @NSManaged var createdDate: NSDate
    @NSManaged var location: Location
    
    class func createInManagedObjectContext(moc: NSManagedObjectContext, name: String, photoName: String, voice: NSData, location: Location ) -> Photo {
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("Location", inManagedObjectContext: moc) as Photo
        newItem.name = name
        newItem.location = location
        newItem.photoName = photoName
        newItem.voice = voice
        
        return newItem
    }
}
