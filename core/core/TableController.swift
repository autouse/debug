//
//  TableController.swift
//  pm
//
//  Created by i on 05/07/2019.
//  Copyright © 2019 i. All rights reserved.
//

import UIKit


class TableController : NSObject, UITableViewDelegate, UITableViewDataSource {
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "msg") as! MessageCell
        cell.message.text = "2019-07-07 00:14:14.992433+0300 pm[338:25746] Unknown class MessageCell in Interface Builder file."
    
        return cell
    }
    
}
