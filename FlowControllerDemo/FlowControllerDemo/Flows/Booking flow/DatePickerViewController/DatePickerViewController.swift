//
//  DatePickerViewController.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/26/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

class DatePickerViewController: BaseViewController {
    
    @IBOutlet weak var oneNightButton: UIButton!
    @IBOutlet weak var twoNightsButton: UIButton!
    @IBOutlet weak var threeNightsButton: UIButton!
    
    var onSelectNightAmount: ((Int)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Date picker"
    }
    
    @IBAction func dateDidTap(_ sender: UIButton) {
        if (sender == oneNightButton) {
            onSelectNightAmount?(1)
        } else if (sender == twoNightsButton) {
            onSelectNightAmount?(2)
        } else if (sender == threeNightsButton) {
            onSelectNightAmount?(3)
        }
    }
    
}

extension Date {
    
    var tomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: self)!
    }
    
    var nextWeek: Date {
        return Calendar.current.date(byAdding: .day, value: 7, to: self)!
    }
    
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }
}
