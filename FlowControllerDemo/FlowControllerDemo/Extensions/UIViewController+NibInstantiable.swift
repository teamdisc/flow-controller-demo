//
//  UIViewController+NibInstantiable.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/24/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

protocol NibInstantiable {
    static var fromNib: Self { get }
}

extension NibInstantiable where Self: UIViewController {
    
//    class func loadFromNib<T: UIViewController>() -> T {
//        return T(nibName: String(describing: self), bundle: nil)
//    }
    
//    static var fromNib: Self {
//        return Self(nibName: String(describing: self), bundle: nil)
//    }
    
}

extension UIViewController {
    
    class func loadFromNib<T: UIViewController>() -> T {
        return T(nibName: String(describing: self), bundle: nil)
    }
    
}
