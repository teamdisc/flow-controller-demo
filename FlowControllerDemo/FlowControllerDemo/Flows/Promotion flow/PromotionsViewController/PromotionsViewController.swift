//
//  PromotionsViewController.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/27/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

class PromotionsViewController: UIViewController {

    @IBOutlet weak var germanyPromotionButton: UIButton!
    @IBOutlet weak var austriaPromotionButton: UIButton!
    @IBOutlet weak var thailandPromotionButton: UIButton!
    
    let countries: [Country] = [.germany, .austria, .thailand]
    var onSelectCountry: ((Country)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        germanyPromotionButton.setTitle(Promotion.berlin.name, for: .normal)
        austriaPromotionButton.setTitle(Promotion.vienna.name, for: .normal)
        thailandPromotionButton.setTitle(Promotion.bangkok.name, for: .normal)
    }
    
    @IBAction func promotionDidTap(_ sender: UIButton) {
        countries.forEach { country in
            if (sender.titleLabel?.text?.contains(country.rawValue)) == true {
                onSelectCountry?(country)
                return
            }
        }
    }
    
}
