//
//  DatePickerViewController.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/26/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {
    
    @IBOutlet weak var todayButton: UIButton!
    @IBOutlet weak var tomorrowButton: UIButton!
    @IBOutlet weak var nextWeekButton: UIButton!
    
    var onSelectDate: ((_ date: Date)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func dateDidTap(_ sender: UIButton) {
        if (sender == todayButton) {
            onSelectDate?(Date().startOfDay)
        } else if (sender == tomorrowButton) {
            onSelectDate?(Date().tomorrow.startOfDay)
        } else if (sender == nextWeekButton) {
            onSelectDate?(Date().nextWeek.startOfDay)
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
