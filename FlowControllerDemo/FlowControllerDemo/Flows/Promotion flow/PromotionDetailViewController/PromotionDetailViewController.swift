//
//  PromotionDetailViewController.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/27/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

class PromotionDetailViewController: BaseViewController {

    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var bookNowButton: UIButton!
    
    var hotel: Hotel?
    var onSelectBookNow: ((_ hotel: Hotel)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Promotion detail"
        detailView.layer.cornerRadius = 8.0
        
        if let hotel = hotel {
            setup(with: hotel)
        }
    }
    
    //MARK:- Private
    
    private func setup(with hotel: Hotel) {
        guard let promotion = hotel.promotion else { return }
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.paragraphSpacing = 8.0
        let attributedString = NSMutableAttributedString(string: promotion.name+"\n",
                                                         attributes: [NSAttributedStringKey.font: Font.demiBold(of: 17),
                                                                      NSAttributedStringKey.paragraphStyle: paragraphStyle.copy()])
        
        paragraphStyle.paragraphSpacing = 2.0
        let titleAttributes = [NSAttributedStringKey.font: Font.medium(of: 16),
                               NSAttributedStringKey.paragraphStyle: paragraphStyle.copy()]
        let itemAttributes = [NSAttributedStringKey.font: Font.regular(of: 16)]
        
        paragraphStyle.firstLineHeadIndent = 12.0
        let descriptionAttributes = [NSAttributedStringKey.font: Font.regular(of: 14),
                                     NSAttributedStringKey.paragraphStyle: paragraphStyle.copy()]
        
        
        // set hotel
        let hotelAttributedString = NSAttributedString.generate(title: "hotel",
                                                                detail: hotel.name,
                                                                titleAttributes: titleAttributes,
                                                                detailAttributes: itemAttributes)
        attributedString.append(hotelAttributedString)
        attributedString.append(.paragraphBreak)
        
        // set discount amount
        let discountText = "\(promotion.discountPerNight.format(decimal: 2)) Baht/night"
        let discountAttributedString = NSAttributedString.generate(title: "discount",
                                                                   detail: discountText,
                                                                   titleAttributes: titleAttributes,
                                                                   detailAttributes: itemAttributes)
        attributedString.append(discountAttributedString)
        attributedString.append(.paragraphBreak)
        
        // set description
        let detailAttributedString = NSAttributedString(string: promotion.description,
                                                        attributes: descriptionAttributes)
        attributedString.append(detailAttributedString)
        
        detailLabel.attributedText = attributedString
    }

    @IBAction func bookNowDidTap(_ sender: UIButton) {
        guard let hotel = hotel else { return }
        onSelectBookNow?(hotel)
    }
    
}
