//
//  RegisterViewController.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 9/5/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    
    @IBOutlet weak var registerView: UIView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextDidTap(_ sender: UIButton) {
    }

}
