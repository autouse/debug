//
//  Locator.swift
//  pm
//
//  Created by i on 09/07/2019.
//  Copyright © 2019 i. All rights reserved.
//

import Foundation
import CoreLocation

class Locator : NSObject, CLLocationManagerDelegate {
    let loc = CLLocationManager()
    override init() {
        super.init()
        loc.requestAlwaysAuthorization()
        loc.allowsBackgroundLocationUpdates = true
        loc.desiredAccuracy = kCLLocationAccuracyBest
        loc.distanceFilter = 1
        loc.delegate = self
        loc.startUpdatingLocation()
    }
    func locationManager(_ manager: CLLocationManager, didStartMonitoringFor region: CLRegion) {
        print("loc start")
    }
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("loc fail", error)
    }
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        //print("loc upd, \(locations.count)")
        for l in locations {
            Router.onLocationUpdate(l)
        }
    }
}
