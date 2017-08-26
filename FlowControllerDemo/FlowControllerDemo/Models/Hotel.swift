//
//  Hotel.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/27/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

struct Hotel {
    
    let name: String
    let country: Country
    let city: String
    
    let promotion: Promotion?
    
    static let berlin = Hotel(name: "Berlin hotel", country: .germany, city: "Berlin", promotion: nil)
    static let koln = Hotel(name: "Köln hotel", country: .germany, city: "Köln", promotion: nil)
    static let munchen = Hotel(name: "München hotel", country: .germany, city: "München", promotion: nil)
    
    static let vienna = Hotel(name: "Vienna hotel", country: .austria, city: "Vienna", promotion: nil)
    static let salzburg = Hotel(name: "Salzburg hotel", country: .austria, city: "Salzburg", promotion: nil)
    static let graz = Hotel(name: "Graz hote", country: .austria, city: "Graz", promotion: nil)
    
    static let bangkok = Hotel(name: "Bangkok hotel", country: .thailand, city: "Bangkok", promotion: nil)
    static let chiangmai = Hotel(name: "Chiangmai hotel", country: .thailand, city: "Chiangmai", promotion: nil)
    static let phuket = Hotel(name: "Phuket hotel", country: .thailand, city: "Phuket", promotion: nil)
    
}

struct Promotion {
    
    let name: String
    let description: String
    let discountPerNight: Double
    
    static let berlin = Promotion(name: "Night in Berlin",
                                  description: description("30 Baht discounted per night!"),
                                  discountPerNight: 30.0)
    
    static let vienna = Promotion(name: "Day in Vienna",
                                  description: description("40 Baht discounted per night!"),
                                  discountPerNight: 40.0)
    
    static let bangkok = Promotion(name: "Moment in Bangkok",
                                   description: description("20 Baht discounted per night!"),
                                   discountPerNight: 20.0)
    
    static func description(_ discountText: String) -> String {
        return "\(discountText)) Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus sodales metus et ultrices rutrum. Pellentesque quis purus non eros pellentesque molestie. Maecenas eget aliquet diam. Aenean fermentum magna eu interdum vehicula. Etiam ac congue urna. Sed quis cursus odio"
    }
}

enum Country: StringLiteralType {
    
    case germany = "Germany"
    case austria = "Austria"
    case thailand = "Thailand"
    
    var hotels: [Hotel] {
        switch self {
        case .germany:      return [.berlin, .koln, .munchen]
        case .austria:      return [.vienna, .salzburg, .graz]
        case .thailand:     return [.bangkok, .chiangmai, .phuket]
        }
    }
    
}
