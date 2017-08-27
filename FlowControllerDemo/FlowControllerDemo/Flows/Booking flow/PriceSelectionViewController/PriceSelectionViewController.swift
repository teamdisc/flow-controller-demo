//
//  PriceSelectionViewController.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/26/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

class PriceSelectionViewController: BaseViewController {
    
    @IBOutlet weak var nonMemberPricebutton: UIButton!
    @IBOutlet weak var nonMemberPriceLabel: UILabel!
    @IBOutlet weak var memberPriceButton: UIButton!
    @IBOutlet weak var memberPriceLabel: UILabel!
    @IBOutlet weak var loginButton: UIButton!
    
    //todo:- view model
    var nightAmount: Int = 0
    var room: Room?
    var isLoggedIn: Bool = false
    
    var onSelectIsMember: ((_ isMember: Bool)->Void)?
    var onSelectLogin: (()->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Price preview"
        setup(with: room, nightAmount: nightAmount)
        
        nonMemberPricebutton.setTitleColor(Color.midnightBlue.withAlphaComponent(0.25),
                                           for: .disabled)
        memberPriceButton.setTitleColor(Color.midnightBlue.withAlphaComponent(0.25),
                                        for: .disabled)
    }
    
    //MARK:- Private
    
    private func setup(with room: Room?, nightAmount: Int) {
        guard let room = room else {
            nonMemberPriceLabel.text = "- Baht"
            memberPriceLabel.text = "- Baht"
            return
        }
        nonMemberPriceLabel.text = room.price(night: nightAmount).format(decimal: 2)+" Baht"
        memberPriceLabel.text = room.price(night: nightAmount,
                                           isMember: true).format(decimal: 2)+" Baht"
    }
    
    private func enableLogin(_ isLoggedIn: Bool) {
        nonMemberPricebutton.isEnabled = !isLoggedIn
        memberPriceButton.isEnabled = isLoggedIn
        loginButton.isHidden = isLoggedIn
    }
    
    //MARK:- IBAction handler
    
    @IBAction func nonMemberPriceDidTap(_ sender: UIButton) {
        onSelectIsMember?(false)
    }
    
    @IBAction func memberPriceDidTap(_ sender: UIButton) {
        onSelectIsMember?(true)
    }

    @IBAction func loginDidTap(_ sender: UIButton) {
        onSelectLogin?()
    }
    
}

extension Double {
    
    /// usage: (3.2395).format(decimal: 2)
    /// result: "3.24"
    func format(decimal: Int) -> String {
        let formatDecimal = ".\(decimal)"
        return String(format: "%\(formatDecimal)f", self)
    }
}
