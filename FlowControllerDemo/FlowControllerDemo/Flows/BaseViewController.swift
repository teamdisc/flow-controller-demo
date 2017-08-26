//
//  BaseViewController.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/27/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    deinit {
        print("### deinit: \(type(of: self))")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.backBarButtonItem = .defaultBack
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        print("### memory warning: \(type(of: self))")
    }

}
