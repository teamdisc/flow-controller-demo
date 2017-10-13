//
//  ObjectConsuming.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 13/10/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

protocol ObjectConsuming {
    
    associatedtype ObjectType
    
    func applyObject(_ object: ObjectType) -> Void
    
}
