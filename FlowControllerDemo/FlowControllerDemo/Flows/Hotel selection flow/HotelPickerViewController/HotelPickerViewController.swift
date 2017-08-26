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
    
    var country: Country?
    var onSelectHotel: ((_ hotel: Hotel)->Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Hotel picker"
        self.navigationItem.backBarButtonItem = .defaultBack
        
        if let country = country {
            let hotels = country.hotels
            firstButton.setTitle(hotels[0].name, for: .normal)
            secondButton.setTitle(hotels[1].name, for: .normal)
            thirdButton.setTitle(hotels[2].name, for: .normal)
        }
        
    }
    
    @IBAction func firstHotelDidTap(_ sender: UIButton) {
        guard let hotel = country?.hotels[0] else { return }
        onSelectHotel?(hotel)
    }
    
    @IBAction func secondHotelDidTap(_ sender: UIButton) {
        guard let hotel = country?.hotels[1] else { return }
        onSelectHotel?(hotel)
    }
    
    @IBAction func thirdHotelDidTap(_ sender: UIButton) {
        guard let hotel = country?.hotels[2] else { return }
        onSelectHotel?(hotel)
    }

}
