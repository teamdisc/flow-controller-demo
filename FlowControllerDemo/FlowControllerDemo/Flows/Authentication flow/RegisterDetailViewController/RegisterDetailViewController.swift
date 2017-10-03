//
//  RegisterDetailViewController.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 9/5/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

class RegisterDetailViewController: UIViewController {
    
    @IBOutlet weak var registerView: UIView!
    @IBOutlet weak var usernameTextField: UIView!
    @IBOutlet weak var passwordTextField: UIView!
    @IBOutlet weak var confirmPasswordTextField: UIView!
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func signUpNowDidTap(_ sender: UIButton) {
    }

}
