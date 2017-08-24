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
    
    var onSelectCountry: ((_ countryName: String)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func countryDidTap(_ sender: UIButton) {
        onSelectCountry?(sender.titleLabel?.text ?? "")
    }
    
}
