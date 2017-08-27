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
    
    private(set) var childFlowController: BookingFlowController?

    var onSelectBookingWithPromotion: ((Promotion)->Void)?
    
    //todo:- start with option?
    
    func start(on navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.router = Router(on: navigationController)
        showPromotions()
    }
    
    func dismissChild() {
        //todo:- iterate to dismiss all flowController of its child
        childFlowController = nil
        router.navigationController.delegate = router
    }
    
    func showPromotions() {
        let controller: PromotionsViewController = PromotionsViewController.loadFromNib()
        
        controller.onSelectHotel = { hotel in
            self.showPromotionDetail(for: hotel)
        }
        router.push(controller)
    }
    
    func showPromotionDetail(for hotel: Hotel) {
        let controller: PromotionDetailViewController = PromotionDetailViewController.loadFromNib()
        controller.hotel = hotel
        controller.onSelectBookNow = { hotel in
            let bookingFlowController = BookingFlowController(hotel: hotel, selectPromotion: true)
            bookingFlowController.onCompleteBooking = {
                self.dismissChild()
            }
            bookingFlowController.start(with: self)
        }
        router.push(controller)
    }
    
}
