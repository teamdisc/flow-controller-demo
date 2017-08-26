//
//  PromotionFlowController.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/27/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

class PromotionFlowController {
    
    private(set) weak var navigationController: UINavigationController?
    private(set) var router: Router!

    var onSelectBookingWithPromotion: ((Promotion)->Void)?
    
    //todo:- start with option?
    
    func start(on navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.router = Router(on: navigationController)
        
    }
    
    func showPromotions() {
        let controller: PromotionsViewController = PromotionsViewController.loadFromNib()
        
        controller.onSelectCountry = { country in
            if let hotel = country.hotels.filter({ $0.promotion != nil }).first {
                self.showPromotionDetail(for: hotel)
            }
        }
        router.push(controller)
    }
    
    func showPromotionDetail(for hotel: Hotel) {
        let controller: PromotionDetailViewController = PromotionDetailViewController.loadFromNib()
        controller.hotel = hotel
        controller.onSelectBookNow = { hotel in
            let bookingFlowController = BookingFlowController(hotel: hotel)
            bookingFlowController.start(on: self.navigationController!)
        }
        router.push(controller)
    }
    
}
