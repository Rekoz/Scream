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
//import Location
//import Photo
//import YYNavViewController
import CoreLocation

class MainViewController: UIViewController, CLLocationManagerDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    let locationManager = CLLocationManager()
    var currentLocation:CLLocation = CLLocation()
    var sortedLocations = [Location]()
    //var navigationController:UINavigationController
    
    lazy var managedObjectContext : NSManagedObjectContext? = {
        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        if let managedObjectContext = appDelegate.managedObjectContext {
            return managedObjectContext
        }
        else {
            return nil
        }
        }()

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("MainCell", forIndexPath: indexPath) as UICollectionViewCell
        //setup the cell
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        var pvc = PhotoViewController()
        //pvc.photo =
        //setup pvc
        self.navigationController?.pushViewController(pvc, animated: true)
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        //deselect
    }
    
    override init() {
        super.init()
    }

    required init(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder:aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        fetchLocations()
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        currentLocation = manager.location
        sortedLocations = sorted(sortedLocations, { (obj1, obj2) -> Bool in
            let l1 = obj1 as Location
            let l2 = obj2 as Location
            var oneDistance = self.currentLocation.distanceFromLocation(CLLocation(latitude: l1.locationX.doubleValue, longitude: l1.locationY.doubleValue))
            var twoDistance = self.currentLocation.distanceFromLocation(CLLocation(latitude: l2.locationX.doubleValue, longitude: l2.locationY.doubleValue))
            //if (oneDistance < twoDistance) { return NSOrderedAscending }
            //if (oneDistance > twoDistance) { return NSOrderedDescending }
            //return NSOrderedSame
            return oneDistance > twoDistance
        })
        
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
            self.sortedLocations = fetchResults
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
