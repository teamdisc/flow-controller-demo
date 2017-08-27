//
//  HotelSelectionFlowController.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/24/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

class HotelSelectionFlowController: FlowController {
    
    var onSelectHotel: ((_ hotel: Hotel)->Void)?
    
    override func start() {
        showHotelSearch()
    }
    
    func showHotelSearch() {
        let controller: HotelSearchViewController = HotelSearchViewController.loadFromNib()
        
        controller.onSelectPickCountry = {
            self.showCountryPicker()
        }
        router.push(controller)
    }
    
    func showCountryPicker() {
        let controller: CountryPickerViewController = CountryPickerViewController.loadFromNib()
        
        controller.onSelectCountry = { country in
            self.showHotelPicker(for: country)
        }
        router.push(controller)
    }
    
    func showHotelPicker(for country: Country) {
        let controller: HotelPickerViewController = HotelPickerViewController.loadFromNib()
        controller.country = country
        controller.onSelectHotel = { hotel in
//            let bookingFlowController = BookingFlowController(hotel: hotel)
//            bookingFlowController.start(on: self.navigationController!)
            let promotionFlowController = PromotionFlowController(on: self.router.navigationController)
            promotionFlowController.start()
        }
        router.push(controller)
    }
    
    
    
}
