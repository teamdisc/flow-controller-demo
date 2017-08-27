//
//  HotelSearchViewController.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/24/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

class HotelSearchViewController: BaseViewController {

    @IBOutlet weak var pickCountryButton: UIButton!
    
    var onSelectPickCountry: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Hotel search"
    }

    @IBAction func pickCountryDidTap(_ sender: Any) {
        onSelectPickCountry?()
    }
    
}
