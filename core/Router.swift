//
//  Router.swift
//  pm
//
//  Created by i on 09/07/2019.
//  Copyright © 2019 i. All rights reserved.
//

import UIKit
import CoreLocation
import CoreData

class Router {
    static var onLocationUpdate: ((CLLocation)->()) = {
        location in
        let point = CorePoint(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        point.insert()
    }
    // core data context
    static var coreDataContext: NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
}
