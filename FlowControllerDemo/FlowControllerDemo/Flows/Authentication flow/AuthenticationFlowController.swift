//
//  AuthenticationFlowController.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 9/5/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

class AuthenticationFlowController: FlowController {
    
    override func start() {
        
    }
    
    //MARK:- Controller showing handler
    
    func showLogin() {
        let controller: LoginViewController = LoginViewController.loadFromNib()
        router.push(controller)
    }
    
    func showRegister() {
        let controller: RegisterViewController = RegisterViewController.loadFromNib()
        router.push(controller)
    }
    
    func showRegisterDetail() {
        let controller: RegisterDetailViewController = RegisterDetailViewController.loadFromNib()
        router.push(controller)
    }
    
}
