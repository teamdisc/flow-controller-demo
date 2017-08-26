//
//  BookingReviewViewController.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/26/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

class BookingReviewViewController: UIViewController {

    @IBOutlet weak var detailsView: UIView!
    @IBOutlet weak var detailsLabel: UILabel!
    @IBOutlet weak var bookNowButton: UIButton!
    
    var reservation: Reservation?
    var onCompleteBooking: (()->Void)? //todo:- booking
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Booking review"
        self.navigationItem.backBarButtonItem = .defaultBack
        detailsView.layer.cornerRadius = 8.0
        if let reservation = reservation {
            setup(with: reservation) 
        }
    }
    
    private func setup(with reservation: Reservation) {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 8.0
        let attributedString = NSMutableAttributedString(string: "Booking review\n",
                                                         attributes: [NSFontAttributeName: Font.demiBold(of: 16),
                                                                      NSParagraphStyleAttributeName: paragraphStyle])
        let itemParagraphStyle = NSMutableParagraphStyle()
        itemParagraphStyle.lineSpacing = 2.0
        let titleAttributes = [NSFontAttributeName: Font.medium(of: 16),
                               NSParagraphStyleAttributeName: itemParagraphStyle]
        let itemAttributes = [NSFontAttributeName: Font.regular(of: 16)]
        
        // set hotel
        let hotelAttributedString = generateAttributedString(title: "hotel",
                                                             detail: reservation.hotel.name,
                                                             titleAttributes: titleAttributes,
                                                             detailAttributes: itemAttributes)
        attributedString.append(hotelAttributedString)
        attributedString.append(.paragraphBreak)
        
        // set guest
        let guestText = reservation.guest.firstName + " " + reservation.guest.lastName
        let guestAttributedString = generateAttributedString(title: "guest",
                                                             detail: guestText.capitalized,
                                                             titleAttributes: titleAttributes,
                                                             detailAttributes: itemAttributes)
        attributedString.append(guestAttributedString)
        attributedString.append(.paragraphBreak)
        
        // set room
        if let room = reservation.room {
            let roomAttributedString = generateAttributedString(title: "room",
                                                                detail: room.rawValue,
                                                                titleAttributes: titleAttributes,
                                                                detailAttributes: itemAttributes)
            attributedString.append(roomAttributedString)
            attributedString.append(.paragraphBreak)
        }
        
        // set night amount
        if (reservation.nightAmount > 0) {
            let nightAmountText = "\(reservation.nightAmount) Night\(reservation.nightAmount > 1 ? "s" : "")"
            let nightsAttributedString = generateAttributedString(title: "night",
                                                                  detail: nightAmountText,
                                                                  titleAttributes: titleAttributes,
                                                                  detailAttributes: itemAttributes)
            attributedString.append(nightsAttributedString)
            attributedString.append(.paragraphBreak)
        }
        
        if let promotion = reservation.promotion {
            let promotionAttributedString = generateAttributedString(title: "promotion",
                                                                     detail: promotion.name,
                                                                     titleAttributes: titleAttributes,
                                                                     detailAttributes: itemAttributes)
            attributedString.append(promotionAttributedString)
            attributedString.append(.paragraphBreak)
        }
        
        // set total price
        let priceText = "\(reservation.price.format(decimal: 2)) Baht"
        let priceAttributedString = generateAttributedString(title: "total",
                                                             detail: priceText,
                                                             titleAttributes: titleAttributes,
                                                             detailAttributes: itemAttributes)
        attributedString.append(priceAttributedString)
        
        detailsLabel.attributedText = attributedString
    }
    
    private func generateAttributedString(title: String,
                                          detail: String,
                                          titleAttributes: [String: Any],
                                          detailAttributes: [String: Any]) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: title+": ",
                                                         attributes: titleAttributes)
        let detailAttributedString = NSAttributedString(string: detail,
                                                        attributes: detailAttributes)
        attributedString.append(detailAttributedString)
        return attributedString.copy() as! NSAttributedString
    }

    @IBAction func bookNowDidTap(_ sender: Any) {
        onCompleteBooking?()
    }

}

extension NSAttributedString {
    
    static let paragraphBreak = NSAttributedString(string: "\n")
    
}
