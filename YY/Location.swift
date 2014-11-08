//
//  Location.swift
//  YY
//
//  Created by Qikun Guo on 11/8/14.
//
//

import Foundation
import CoreData
import CoreLocation

class Location: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var locationX: NSNumber
    @NSManaged var locationY: NSNumber
    @NSManaged var thumbnail: NSData
    @NSManaged var photos: NSSet
    
    /*func Coordinate() -> CLLocationCoordinate2D {
        return CLLocationCoordinate2D(latitude: locationX.doubleValue, longitude: locationY.doubleValue)
    }*/
    
    class func createInManagedObjectContext(moc: NSManagedObjectContext, name: String, locationX: NSNumber, locationY: NSNumber ) -> Location {
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("Location", inManagedObjectContext: moc) as Location
        newItem.name = name
        newItem.locationX = locationX
        newItem.locationY = locationY
        
        return newItem
    }

}
