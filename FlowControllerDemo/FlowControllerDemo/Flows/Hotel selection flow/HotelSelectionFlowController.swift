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
    
    var onSelectHotel: ((_ hotelName: String)->Void)?
    
    func start(on navigationController: UINavigationController) {
        self.navigationController = navigationController
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
        controller.onSelectHotel = onSelectHotel
        
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
