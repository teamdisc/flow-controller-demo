//
//  Theme.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/26/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

struct Color {
    
    static let turquoise = UIColor(26, 188, 156)
    static let darkTurquoise = UIColor(22, 160, 133)
    
    static let midnightBlue = UIColor(52, 73, 94)
    static let darkMidnightBlue = UIColor(44, 62, 80)
    
    static let cloudWhite = UIColor(236, 240, 241)
    static let silver = UIColor(189, 195, 199)
}

struct Font {
    
    static func ultraLight(of size: Int) -> UIFont {
        return UIFont(name: "AvenirNext-Ultralight", size: CGFloat(size))!
    }
    
    static func regular(of size: Int) -> UIFont {
        return UIFont(name: "AvenirNext-Regular", size: CGFloat(size))!
    }
    
    static func medium(of size: Int) -> UIFont {
        return UIFont(name: "AvenirNext-Medium", size: CGFloat(size))!
    }
    
    static func demiBold(of size: Int) -> UIFont {
        return UIFont(name: "AvenirNext-DemiBold", size: CGFloat(size))!
    }
    
    static func bold(of size: Int) -> UIFont {
        return UIFont(name: "AvenirNext-Bold", size: CGFloat(size))!
    }
    
    static func heavy(of size: Int) -> UIFont {
        return UIFont(name: "AvenirNext-Heavy", size: CGFloat(size))!
    }
    
}

extension UIColor {
    
    convenience init(_ r: Int, _ g: Int, _ b: Int, alpha: Double = 1.0) {
        self.init(red: CGFloat(r/255),
                  green: CGFloat(g/255),
                  blue: CGFloat(b/255),
                  alpha: CGFloat(alpha))
    }
    
}
