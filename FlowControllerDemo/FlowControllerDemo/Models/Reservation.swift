//
//  Reservation.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/24/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import Foundation

struct Reservation {
    
    var date: Date?
    var room: Room?
    var price: Double = 0.0
    var guest: Guest = Guest()
    
}

struct Guest {
    var firstName: String = ""
    var lastName: String = ""
    var email: String = ""
}

enum Room: StringLiteralType {
    
    case double = "Double Room"
    case twin = "Twin Room"
    case deluexe = "Deluxe Room"
    
    var pricePerNight: Double {
        switch self {
        case .double:   return 200.0
        case .twin:     return 100.0
        case .deluexe:  return 500.0
        }
    }
}
