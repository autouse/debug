//
//  Router.swift
//  pm
//
//  Created by i on 09/07/2019.
//  Copyright © 2019 i. All rights reserved.
//

import Foundation
import CoreLocation

class Router {
    static var onLocationUpdate: ((CLLocation)->()) = {l in print(l)}
}
