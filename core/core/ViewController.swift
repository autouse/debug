//
//  ViewController.swift
//  pm
//
//  Created by i on 05/07/2019.
//  Copyright © 2019 i. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var table: UITableView!
    
    let data = TableController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = data
        table.dataSource = data
        table.separatorInset = UIEdgeInsets.zero
        table.separatorColor = UIColor(white: 0.9, alpha: 1)
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 1
    }


}

