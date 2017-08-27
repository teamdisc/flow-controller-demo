//
//  FlowController.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/26/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

class FlowController {
    
    private(set) var navigationController: UINavigationController
    private(set) var childFlowController: FlowController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
    
    func start(withParentFlowController parentFlowController: FlowController) {
        navigationController = parentFlowController.navigationController
        
    }
    
    func proceed(to nextFlow: FlowController) {
        childFlowController = nextFlow
        nextFlow.start(withParentFlowController: self)
    }
    
}

protocol FlowControllable {
    
    var router: Router { get }
    
    var childFlowController: FlowControllable? { get }
    var parentFlowController: FlowControllable? { get }
    
    func start()
    func dismissChild(animated: Bool)
    func dismiss(animated: Bool)
    func proceed(to nextFlowControllable: FlowControllable)
    
}

class TestFlowController: FlowControllable {
    
    private(set) var childFlowController: FlowControllable?
    private(set) var parentFlowController: FlowControllable?
    private(set) var router: Router
    
    init(on navigationController: UINavigationController) {
        router = Router(on: navigationController)
    }
    
    func start() {
        
    }
    
    func dismissChild(animated: Bool = true) {
        
    }
    
    func dismiss(animated: Bool = true) {
        
    }
    
    func proceed(to nextFlowControllable: FlowControllable) {
        
    }
    
}

extension FlowControllable {
    
    func dismiss(animated: Bool = true) {
        router.dismiss(animated: animated)
        parentFlowController?.router.navigationController.delegate = router
    }
    
}
