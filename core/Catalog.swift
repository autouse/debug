//
//  Catalog.swift
//  pm
//
//  Created by i on 08/07/2019.
//  Copyright © 2019 i. All rights reserved.
//

import Foundation

class Catalog {
    
    init() {
        DispatchQueue.global().async {
            self.load()
        }
    }
    
    func load() {
        if let txt = try? String(contentsOf: URL(string: "http://raw.github.com/autouse/debug/master/catalog.txt")!) {
            print(txt)
        } else {
            print("catalog failed")
        }
    }
}
