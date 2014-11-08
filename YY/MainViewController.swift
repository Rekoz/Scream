//
//  MainViewController.swift
//  YY
//
//  Created by Qikun Guo on 11/8/14.
//
//

import Foundation
import UIKit
import CoreData
import Location
import Photo
import YYNavViewController
import CoreLocation

class MainViewController: UIViewController, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    var currentLocation:CLLocation
    var sortedLocations = [Location]()
    
    lazy var managedObjectContext : NSManagedObjectContext? = {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        if let managedObjectContext = appDelegate.managedObjectContext {
            return managedObjectContext
        }
        else {
            return nil
        }
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        /*
        LogItem.createInManagedObjectContext(self.managedObjectContext!, title: "1st Item", text: "This is my first log item")
        LogItem.createInManagedObjectContext(self.managedObjectContext!, title: "2nd Item", text: "This is my second log item")
        LogItem.createInManagedObjectContext(self.managedObjectContext!, title: "3rd Item", text: "This is my third log item")
        LogItem.createInManagedObjectContext(self.managedObjectContext!, title: "4th Item", text: "This is my fourth log item")
        LogItem.createInManagedObjectContext(self.managedObjectContext!, title: "5th Item", text: "This is my fifth log item")
        LogItem.createInManagedObjectContext(self.managedObjectContext!, title: "6th Item", text: "This is my sixth log item")
        */
        
        fetchLocations()
        
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        currentLocation = manager.location
        sortedLocations = sorted(sortedLocations) {
            (obj1, obj2) in
            let l1 = obj1 as Location
            let l2 = obj2 as Location
            var oneDistance = currentLocation.distanceFromLocation(CLLocation(latitude: l1.locationX.doubleValue, longitude: l1.locationY.doubleValue))
            var twoDistance = currentLocation.distanceFromLocation(CLLocation(latitude: l2.locationX.doubleValue, longitude: l2.locationY.doubleValue))
            if (oneDistance < twoDistance) { return NSOrderedAscending }
            if (oneDistance > twoDistance) { return NSOrderedDescending }
            return NSOrderedSame
        }
        
            /*
            CLGeocoder().reverseGeocodeLocation(manager.location, completionHandler: {(placemarks, error)->Void in
            
            if (error != nil) {
                println("Reverse geocoder failed with error" + error.localizedDescription)
                return
            }
            
            if placemarks.count > 0 {
                let pm = placemarks[0] as CLPlacemark
                self.displayLocationInfo(pm)
            } else {
                println("Problem with the data received from geocoder")
            }
        })*/
    }
    
    /*
    func displayLocationInfo(placemark: CLPlacemark?) {
        if let containsPlacemark = placemark {
            //stop updating location to save battery life
            locationManager.stopUpdatingLocation()
            let locality = (containsPlacemark.locality != nil) ? containsPlacemark.locality : ""
            let postalCode = (containsPlacemark.postalCode != nil) ? containsPlacemark.postalCode : ""
            let administrativeArea = (containsPlacemark.administrativeArea != nil) ? containsPlacemark.administrativeArea : ""
            let country = (containsPlacemark.country != nil) ? containsPlacemark.country : ""
            println(locality)
            println(postalCode)
            println(administrativeArea)
            println(country)
        }
        
    }*/
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Error while updating location " + error.localizedDescription)
    }
    
    func fetchLocations() {
        let fetchRequest = NSFetchRequest(entityName: "Location")
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [Location] {
            allLocations = fetchResults
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}