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
    lazy var managedObjectContext : NSManagedObjectContext? = {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        if let managedObjectContext = appDelegate.managedObjectContext {
            return managedObjectContext
        }
        else {
            return nil
        }
        }()
    class func generate() {
        
    }
}
