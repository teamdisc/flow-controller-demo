//
//  Reservation.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/24/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

struct Reservation {
    
    let hotel: Hotel
    
    var nightAmount: Int = 0
    var room: Room?
    var guest: Guest = Guest()
    var promotion: Promotion?
    var isMember: Bool = false
    
    var price: Double {
        return room?.price(night: nightAmount, isMember: isMember, promotion: promotion) ?? 0.0
    }
    
    init(hotel: Hotel) {
        self.hotel = hotel
    }
    
}

struct Guest {
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
}

enum Room: StringLiteralType {
    
    case double = "Double Room"
    case twin = "Twin Room"
    case deluxe = "Deluxe Room"
    
    var pricePerNight: Double {
        switch self {
        case .double:   return 400.0
        case .twin:     return 300.0
        case .deluxe:  return 800.0
        }
    }
    
    var memberDiscountPerNight: Double {
        switch self {
        case .double:   return 40.0
        case .twin:     return 20.0
        case .deluxe:  return 80.0
        }
    }
    
    func price(night: Int, isMember: Bool = false, promotion: Promotion? = nil) -> Double {
        let totalPrice = self.pricePerNight * Double(night)
        let discount = isMember ? self.memberDiscountPerNight * Double(night) : 0.0
        let promotionDiscount = (promotion != nil) ? promotion!.discountPerNight * Double(night) : 0.0
        return totalPrice-discount-promotionDiscount
    }
}
