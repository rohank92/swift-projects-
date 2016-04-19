//
//  ViewController.swift
//  maps integration
//
//  Created by Rohan Kumar on 4/17/16.
//  Copyright © 2016 fishnchips. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet var map: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //maps integration
        //17.458947, 78.499818 <-- grill 9 (restaurant) coordinates
        //initialize the map so it centers on grill 9
        let lat:CLLocationDegrees = 17.458947
        let long:CLLocationDegrees = 78.499818
        let latDelta:CLLocationDegrees = 0.01
        let longDelta:CLLocationDegrees = 0.01
        let location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(lat, long)
        let span: MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        let region: MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        map.setRegion(region, animated: true)

        //annotations
        //generate annotation here. then set title and subtitle for the same
//        let annotation = MKPointAnnotation()
//        annotation.coordinate = location
//        annotation.title = "Grill 9 Restaurant"
//        annotation.subtitle = "Best grill chicken in hyd"
//        map.addAnnotation(annotation)
        
        //now Long press gesture. when that happens we're going to add an annotation there (drop a pin there)
        let uilpgr = UILongPressGestureRecognizer(target: self, action: "addPin:")
        uilpgr.minimumPressDuration = 2
        map.addGestureRecognizer(uilpgr)
        
    }
   
    func addPin (gestureRecognizer : UIGestureRecognizer)
    {
        //gestureRecognizer is just a placeholder name. it can be anything. chewbacca also if you like
        let pointOfPress = gestureRecognizer.locationInView(self.map)
        let newCoord : CLLocationCoordinate2D = map.convertPoint(pointOfPress, toCoordinateFromView: self.map)
        let pin = MKPointAnnotation()
        pin.coordinate = newCoord
        pin.title = "hello"
        pin.subtitle = "hello there"
        map.addAnnotation(pin)
    }
        
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

