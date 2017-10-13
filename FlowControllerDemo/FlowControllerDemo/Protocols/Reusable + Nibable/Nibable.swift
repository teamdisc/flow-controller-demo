//
//  NibInstantiated.swift
//  travelbook
//
//  Created by Pirush Prechathavanich on 9/10/17.
//
//

import UIKit

protocol Nibable {
    
    static var nib: UINib { get }
    
}

extension Nibable {
    
    static var nib: UINib {
        return UINib(nibName: String(describing: Self.self), bundle: nil)
    }
    
}
