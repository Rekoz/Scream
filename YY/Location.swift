//
//  Location.swift
//  YY
//
//  Created by Qikun Guo on 11/8/14.
//
//

import Foundation
import CoreData

class Location: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var locationX: NSNumber
    @NSManaged var locationY: NSNumber
    @NSManaged var thumbnail: NSData
    @NSManaged var photos: NSSet

}
