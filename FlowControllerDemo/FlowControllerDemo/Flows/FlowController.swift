//
//  FlowController.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/26/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

//class FlowController {
//    
//    private(set) var navigationController: UINavigationController
//    private(set) var childFlowController: FlowController?
//    
//    init(navigationController: UINavigationController) {
//        self.navigationController = navigationController
//    }
//    
//    func start() {
//        
//    }
//    
//    func start(withParentFlowController parentFlowController: FlowController) {
//        navigationController = parentFlowController.navigationController
//        
//    }
//    
//    func proceed(to nextFlow: FlowController) {
//        childFlowController = nextFlow
//        nextFlow.start(withParentFlowController: self)
//    }
//    
//}


protocol FlowControllable: class {
    
    var router: Router { get }
    
    var childFlowController: FlowControllable? { get }
    weak var parentFlowController: FlowControllable? { get }
    
    func start()
    func start(from parentControllable: FlowControllable)
    func dismiss(animated: Bool)
    func dismissChild(animated: Bool)
    func proceed(to nextFlowControllable: FlowControllable)
    
}

class FlowController: FlowControllable {
    
    private(set) var childFlowController: FlowControllable?
    private(set) weak var parentFlowController: FlowControllable?
    private(set) var router: Router
    
    deinit {
        print("### deinit: \(self)")
    }
    
    init(on navigationController: UINavigationController) {
        router = Router(on: navigationController)
        router.onDismiss = { [unowned self] in
            if let parentFlowController = self.parentFlowController {
                parentFlowController.dismissChild(animated: true)
            }
        }
    }
    
    func start() {
        //customizable implementaion
    }
    
    //todo:- private?
    func start(from parentControllable: FlowControllable) {
        self.parentFlowController = parentControllable
        start()
    }
    
    func dismissChild(animated: Bool = true) {
        childFlowController?.dismiss(animated: animated)
        childFlowController = nil
    }
    
    func dismiss(animated: Bool = true) {
        router.dismiss(animated: animated)
        if let parentRouter = parentFlowController?.router {
            parentRouter.navigationController.delegate = parentRouter
        }
    }
    
    func proceed(to nextFlowControllable: FlowControllable) {
        childFlowController = nextFlowControllable
        nextFlowControllable.start(from: self)
    }
    
}
