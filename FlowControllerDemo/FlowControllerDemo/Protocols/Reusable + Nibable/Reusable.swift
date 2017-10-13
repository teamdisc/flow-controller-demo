//
//  Reusable.swift
//  travelbook
//
//  Created by Pirush Prechathavanich on 9/10/17.
//
//

protocol Reusable {
    
    static var reuseIdentifier: String { get }
    
}

extension Reusable {
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
}
