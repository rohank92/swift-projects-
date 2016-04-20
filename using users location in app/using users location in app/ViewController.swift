//
//  ViewController.swift
//  using users location in app
//
//  Created by Rohan Kumar on 4/20/16.
//  Copyright © 2016 fishnchips. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate , CLLocationManagerDelegate {

    @IBOutlet var map: MKMapView!
    
    //use the locManager to get the users location
    
    var locManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locManager.delegate = self
        locManager.desiredAccuracy = kCLLocationAccuracyBest
        locManager.requestWhenInUseAuthorization()
        locManager.startUpdatingLocation()
        map.showsUserLocation = true
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        print(locations)
        let coords: CLLocation = locations[0]
        let latDelta: CLLocationDegrees = 0.01
        let longDelta: CLLocationDegrees = 0.01
        let long : CLLocationDegrees = coords.coordinate.longitude
        let lat : CLLocationDegrees = coords.coordinate.latitude
        let userLocation: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
        let span : MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(userLocation, span)
        map.setRegion(region, animated: true)
        print(lat)
        print(long)
        print("==========")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

