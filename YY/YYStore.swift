//
//  YYStore.swift
//  YY
//
//  Created by Qikun Guo on 11/8/14.
//
//

import Foundation
import CoreData
import Photo
import Location

class YYStore:NSObject {
    var allLocations:[Location] = [Location]()
    var model:NSManagedObjectModel
    var context:NSManagedObjectContext
    
    /*class func defaultStore() -> YYStore {
        static var defaultStore:YYStore = nil
        if !(let ds = defaultStore) {
            defaultStore = YYStore()
        }
        return defaultStore
    }
    */
    override init() {
        super.init()
        
    }
}