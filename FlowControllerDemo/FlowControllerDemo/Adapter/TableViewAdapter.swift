//
//  TableViewAdapter.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 13/10/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import Foundation
import UIKit
import ReactiveSwift

class TableViewAdapter<ObjectType>: NSObject, UITableViewDataSource, UITableViewDelegate {
    
    private weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 0.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    func register() {
        
    }
    
}

