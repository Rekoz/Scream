//
//  MainViewController.swift
//  YY
//
//  Created by Qikun Guo on 11/8/14.
//
//

import UIKit
import CoreData
import CoreLocation

class MainViewController: UIViewController, CLLocationManagerDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    let locationManager = CLLocationManager()
    var currentLocation:CLLocation = CLLocation()
    var sortedPhotos = [Photo]()
    //var temp = [UICollectionViewCell]()
    //var navigationController:UINavigationController
    
    @IBOutlet weak var collectionView: UICollectionView!
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
        return 15
    }
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as UICollectionViewCell
        
        cell.backgroundView = UIImageView(image: UIImage(contentsOfFile: NSBundle.mainBundle().pathForResource("IMG_2165", ofType: "JPG")!))
        //temp.append(cell)
        //var cell = MainCell()
        //setup the cell
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        var pvc = PhotoViewController(nibName: "PhotoView", bundle: nil)
        for p in sortedPhotos {
            NSLog(String(p.name))
        }
        pvc.photo = sortedPhotos[indexPath.length]
        self.navigationController?.pushViewController(pvc, animated: true)
    }
    
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        //deselect
    }
    
    /*override init() {
        super.init()
    }*/

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: "MainView", bundle: nibBundleOrNil)
    }
    
    required init(coder aDecoder: NSCoder) {
        //fatalError("init(coder:) has not been implemented")
        super.init(coder:aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Photo.createInManagedObjectContext(managedObjectContext!, name: "123", photo: NSData(), voice: "Hello", pitch: 100, locationX: 1, locationY: 2)

        let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
        appDelegate.saveContext()

        //let nib = UINib(nibName:"MainCell", bundle:nil)
        //self.collectionView.registerNib(nib, forCellWithReuseIdentifier:"Cell");
        self.collectionView.registerClass(MainCell.self, forCellWithReuseIdentifier: "Cell")

        self.navigationItem.title = "SCREAM"
        //self.navigationItem.leftBarButtonItem = UIBarButtonItem(BarButtonSystemItem: UIBarButtonSystemItemDone, target:self, action:nil)
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: Selector("openAdd"))
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        fetchLocations()
    }
    
    func openAdd() {
        var avc = AddViewController(nibName: "AddView", bundle: nil)
        self.navigationController?.pushViewController(avc, animated: true)
    }
    
    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        currentLocation = manager.location
        sortedPhotos = sorted(sortedPhotos, { (obj1, obj2) -> Bool in
            let l1 = obj1 as Photo
            let l2 = obj2 as Photo
            var oneDistance = self.currentLocation.distanceFromLocation(CLLocation(latitude: l1.locationX.doubleValue, longitude: l1.locationY.doubleValue))
            var twoDistance = self.currentLocation.distanceFromLocation(CLLocation(latitude: l2.locationX.doubleValue, longitude: l2.locationY.doubleValue))
            //if (oneDistance < twoDistance) { return NSOrderedAscending }
            //if (oneDistance > twoDistance) { return NSOrderedDescending }
            //return NSOrderedSame
            return oneDistance < twoDistance
        })
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println("Error while updating location " + error.localizedDescription)
    }
    
    func fetchLocations() {
        let fetchRequest = NSFetchRequest(entityName: "Photo")
        if let fetchResults = managedObjectContext!.executeFetchRequest(fetchRequest, error: nil) as? [Photo] {
            self.sortedPhotos = fetchResults
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
