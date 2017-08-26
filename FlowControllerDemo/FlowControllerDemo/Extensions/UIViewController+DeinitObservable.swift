//
//  UIViewController+DeinitObservable.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/26/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

//MARK:- Deinit watcher
//todo:- create Observable object to make subscribable to multiple blocks

class DeinitObservable {
    
    var onDeinit: (()->Void)
    
    init(_ onDeinit: @escaping ()->Void) {
        self.onDeinit = onDeinit
    }
    
    deinit { onDeinit() }
}

extension UIViewController {
    
    var deinitObservableKey: String { return "DeinitObservableKey" }
    
    var onDeinit: (()->Void)? {
        get { return self.onDeinit }
        set {
            guard let onDeinit = newValue else { return }
            if let deinitObservable = objc_getAssociatedObject(self, deinitObservableKey) as? DeinitObservable {
                deinitObservable.onDeinit = onDeinit
            } else {
                objc_setAssociatedObject(self,
                                         deinitObservableKey,
                                         DeinitObservable(onDeinit),
                                         .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
        }
    }
    
}
