//
//  HotelPickerViewController.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/24/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

class HotelPickerViewController: UIViewController {
    
    @IBOutlet weak var firstButton: UIButton!
    @IBOutlet weak var secondButton: UIButton!
    @IBOutlet weak var thirdButton: UIButton!
    
    var countryName: String?
    var onSelectHotel: ((_ hotelName: String)->Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Hotel picker"
        self.navigationItem.backBarButtonItem = .defaultBack
        
        if let countryName = countryName {
            firstButton.setTitle(countryName+" 1st hotel", for: .normal)
            secondButton.setTitle(countryName+" 2nd hotel", for: .normal)
            thirdButton.setTitle(countryName+" 3rd hotel", for: .normal)
        }
        
    }
    
    @IBAction func firstHotelDidTap(_ sender: UIButton) {
        onSelectHotel?(sender.titleLabel?.text ?? "")
    }
    
    @IBAction func secondHotelDidTap(_ sender: UIButton) {
        onSelectHotel?(sender.titleLabel?.text ?? "")
    }
    
    @IBAction func thirdHotelDidTap(_ sender: UIButton) {
        onSelectHotel?(sender.titleLabel?.text ?? "")
    }

}
