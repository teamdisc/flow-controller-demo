//
//  GuestDetailViewController.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/26/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

class GuestDetailViewController: BaseViewController {
    
    @IBOutlet weak var fieldsView: UIView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var continueButton: UIButton!
    
    var guest: Guest = Guest()
    var onCompleteGuestDetail: ((Guest)->Void)?
    var onDidDisappear: ((Guest)->Void)?
    
    //MARK:- Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Guest information"
        setup(with: guest)
        setupView()
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        applyGuest()
        onDidDisappear?(guest)
    }
    
    func applyDetails(with guest: Guest) {
        self.guest = guest
        setup(with: guest)
    }
    
    @IBAction func continueDidTap(_ sender: UIButton) {
        complete()
    }
    
    //MARK:- Private
    
    private func setupView() {
        var tagCount = 0
        fieldsView.layer.cornerRadius = 8.0
        fieldsView.subviews
            .forEach {
                guard let textField = $0 as? UITextField else { return }
                textField.delegate = self
                textField.tag = tagCount
                tagCount += 1
        }
    }
    
    private func setup(with guest: Guest) {
        firstNameTextField.text = guest.firstName
        lastNameTextField.text = guest.lastName
        emailTextField.text = guest.email
    }
    
    private func applyGuest() {
        guest.firstName = firstNameTextField.text ?? ""
        guest.lastName = lastNameTextField.text ?? ""
        guest.email = emailTextField.text ?? ""
    }
    
    fileprivate func complete() {
        //todo:- validate
        applyGuest()
        onDidDisappear = nil
        onCompleteGuestDetail?(guest)
    }
    
}

//MARK:- UITextFieldDelegate

extension GuestDetailViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = self.view.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
            self.complete()
        }
        return false; // ignore a line break
    }
    
}
