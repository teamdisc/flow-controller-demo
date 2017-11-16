//
//  Datasource.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 13/10/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import Foundation
import ReactiveSwift

struct Metatype<T>: Hashable {
    
    static func ==(lhs: Metatype, rhs: Metatype) -> Bool {
        return lhs.base == rhs.base
    }
    
    let base: T.Type
    
    init(_ base: T.Type) {
        self.base = base
    }
    
    var hashValue: Int {
        return ObjectIdentifier(base).hashValue
    }
    
}
