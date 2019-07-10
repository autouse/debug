//
//  CorePoint.swift
//  core
//
//  Created by i on 09/07/2019.
//  Copyright © 2019 i. All rights reserved.
//

import UIKit
import CoreData

class CorePoint {
    
    var lat: Double
    var lon: Double
    init(latitude: Double, longitude: Double) {
        lat = latitude
        lon = longitude
    }
    public func insert() {
        let context = Router.coreDataContext
        let entity = NSEntityDescription.entity(forEntityName: "Point", in: context)!
        let point = NSManagedObject(entity: entity, insertInto: context)
        point.setValue(lat, forKey: "lat")
        point.setValue(lon, forKey: "lon")
        do {
            try context.save()
            print("saved: ( \(lat) , \(lon) )")
        } catch let error as NSError{
            print("save error", error.localizedDescription)
        }
    }
}
