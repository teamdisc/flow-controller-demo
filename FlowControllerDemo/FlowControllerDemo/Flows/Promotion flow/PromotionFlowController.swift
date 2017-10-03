//
//  PromotionFlowController.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/27/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

class PromotionFlowController: FlowController  {

    var onSelectBookingWithPromotion: ((Promotion)->Void)?
    
    override func start() {
        showPromotions()
    }
    
    func showPromotions() {
//        let controller: PromotionsViewController = PromotionsViewController.loadFromNib()
//        
//        controller.onSelectHotel = { hotel in
//            self.showPromotionDetail(for: hotel)
//        }
        let controller: LoginViewController = LoginViewController.loadFromNib()
        router.push(controller)
    }
    
    func showPromotionDetail(for hotel: Hotel) {
        let controller: PromotionDetailViewController = PromotionDetailViewController.loadFromNib()
        controller.hotel = hotel
        controller.onSelectBookNow = { hotel in
            self.proceedToBookingFlow(for: hotel)
        }
        router.push(controller)
    }
    
    func proceedToBookingFlow(for hotel: Hotel) {
        let bookingFlowController = BookingFlowController(on: self.router.navigationController,
                                                          for: .promotion(with: hotel))
        bookingFlowController.onCompleteBooking = { [unowned self] in
            self.dismissChild()
        }
        bookingFlowController.onDismiss = { [unowned self] in
            self.dismissChild()
        }
        self.proceed(to: bookingFlowController)
    }
    
}
