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
