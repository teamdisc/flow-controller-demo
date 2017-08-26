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
    
    let hotels: [Hotel] = [.berlin, .vienna, .bangkok]
    var onSelectHotel: ((Hotel)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Promotions"
        self.navigationItem.backBarButtonItem = .defaultBack
        
        germanyPromotionButton.setTitle(Promotion.nightInBerlin.name, for: .normal)
        austriaPromotionButton.setTitle(Promotion.dayInVienna.name, for: .normal)
        thailandPromotionButton.setTitle(Promotion.momentInBangkok.name, for: .normal)
    }
    
    @IBAction func promotionDidTap(_ sender: UIButton) {
        hotels.forEach { hotel in
            if let promotionName = sender.titleLabel?.text,
                promotionName.contains(hotel.city) {
                onSelectHotel?(hotel)
                return
            }
        }
    }
    
}
