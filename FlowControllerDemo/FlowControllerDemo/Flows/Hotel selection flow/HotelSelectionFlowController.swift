//
//  HotelSelectionFlowController.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/24/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

class HotelSelectionFlowController {
    
    private(set) weak var navigationController: UINavigationController?
    private(set) weak var parentFlowController: FlowController?
    private(set) var childFlowController: FlowController?
    private(set) var router: Router!
    
    var onSelectHotel: ((_ hotel: Hotel)->Void)?
    
    func start(on navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.router = Router(on: navigationController)
        showHotelSearch()
    }
    
    func showHotelSearch() {
        let controller: HotelSearchViewController = HotelSearchViewController.loadFromNib()
        
        controller.onSelectPickCountry = {
            self.showCountryPicker()
        }
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func showCountryPicker() {
        let controller: CountryPickerViewController = CountryPickerViewController.loadFromNib()
        
        controller.onSelectCountry = { country in
            self.showHotelPicker(for: country)
        }
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func showHotelPicker(for country: Country) {
        let controller: HotelPickerViewController = HotelPickerViewController.loadFromNib()
        controller.country = country
        controller.onSelectHotel = { hotel in
//            let bookingFlowController = BookingFlowController(hotel: hotel)
//            bookingFlowController.start(on: self.navigationController!)
            let promotionFlowController = PromotionFlowController()
            promotionFlowController.start(on: self.navigationController!)
        }
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    
}
