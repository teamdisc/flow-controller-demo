//
//  LoginViewController.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 9/3/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK:- Private
    
    private func setupView() {
        usernameTextField.leftView = generateLeftView(with: #imageLiteral(resourceName: "icon-user"))
        usernameTextField.leftViewMode = .always
        passwordTextField.leftView = generateLeftView(with: #imageLiteral(resourceName: "icon-password"))
        passwordTextField.leftViewMode = .always
        loginView.layer.cornerRadius = 8.0
    }
    
    private func generateLeftView(with image: UIImage) -> UIView {
        let leftView = UIView(frame: CGRect(x: 0, y: 0, width: 26, height: 18))
        let iconImageView = UIImageView(frame: CGRect(x: 8, y: 0, width: 18, height: 18))
        iconImageView.image = image.withRenderingMode(.alwaysTemplate)
        iconImageView.contentMode = .scaleAspectFit
        iconImageView.tintColor = Color.silver
        leftView.addSubview(iconImageView)
        return leftView
    }
    
    //MARK:- IBAction

    @IBAction func loginDidTap(_ sender: UIButton) {
    }
    
    @IBAction func registerDidTap(_ sender: UIButton) {
    }
    
}
