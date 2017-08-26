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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func dateDidTap(_ sender: UIButton) {
    }
    

}
