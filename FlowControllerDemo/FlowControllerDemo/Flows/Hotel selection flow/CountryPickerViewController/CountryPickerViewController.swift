//
//  CountryPickerViewController.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/24/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

class CountryPickerViewController: UIViewController {
    
    @IBOutlet weak var austriaButton: UIButton!
    @IBOutlet weak var germanyButton: UIButton!
    @IBOutlet weak var thailandButton: UIButton!
    
    var onSelectCountry: ((Country)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Country picker"
        self.navigationItem.backBarButtonItem = .defaultBack
    }
    
    @IBAction func countryDidTap(_ sender: UIButton) {
        if let country = Country(rawValue: sender.titleLabel?.text ?? "") {
            onSelectCountry?(country)
        }
    }
    
}
