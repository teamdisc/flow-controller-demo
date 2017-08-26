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
    
    var onSelectHotel: ((_ hotelName: String)->Void)?
    
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
        
        controller.onSelectCountry = { countryName in
            self.showHotelPicker(for: countryName)
        }
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
    func showHotelPicker(for countryName: String) {
        let controller: HotelPickerViewController = HotelPickerViewController.loadFromNib()
        controller.countryName = countryName
        controller.onSelectHotel = { hotelName in
            let bookingFlowController = BookingFlowController(hotelName: hotelName)
            bookingFlowController.start(on: self.navigationController!)
        }
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
    
}
