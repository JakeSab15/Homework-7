//
//  DistanceViewController.swift
//  Homework 7
//
//  Created by Jakob Sabatula on 5/2/20.
//  Copyright © 2020 Jakob Sabatula. All rights reserved.
//

import UIKit
import CoreLocation

class DistanceViewController: UITabBarController, CLLocationManagerDelegate {

    
    @IBOutlet weak var distanceLabel: UILabel!
    
    let locMan: CLLocationManager = CLLocationManager()
    var startLocation: CLLocation!
    
    
    let kmbLatitude: CLLocationDegrees = 40.712776
    let kmbLongitude: CLLocationDegrees = -74.005974

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let newLocation: CLLocation=locations[0]
        NSLog("Something is happening")
        
        // horizontal accuracy less than than 0 means failure at gps level
        if newLocation.horizontalAccuracy >= 0 {
            
            
            let nyc:CLLocation = CLLocation(latitude: kmbLatitude,longitude: kmbLongitude)

            let delta:CLLocationDistance = nyc.distance(from: newLocation)
            
            let miles: Double = (delta * 0.000621371) + 0.5 // meters to rounded miles
            
            if miles < 3 {
               
                locMan.stopUpdatingLocation()
                
                distanceLabel.text = "Enjoy \nNew York City!"
            } else {
                let commaDelimited: NumberFormatter = NumberFormatter()
                commaDelimited.numberStyle = NumberFormatter.Style.decimal
                
                distanceLabel.text=commaDelimited.string(from: NSNumber(value: miles))!+" miles to New York City"
                }
            
        }
    }
             override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        locMan.delegate = self
        locMan.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locMan.distanceFilter = 1609; // a mile (in meters)
        locMan.requestWhenInUseAuthorization() // verify access to gps
        locMan.startUpdatingLocation()
        startLocation = nil
                    
    }

}




