//
//  ApplicationFlowController.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/27/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

class ApplicationFlowController {
    
    let tabRouter: TabRouter
    var flowControllers: [FlowController]
    
    init(on tabBarController: UITabBarController, with flowControllers: [FlowController]) {
        self.tabRouter = TabRouter(on: tabBarController, with: flowControllers)
        self.flowControllers = flowControllers
    }
    
    func customize(for flowController: FlowController,
                   customizationHandler: ((UITabBarItem)->Void)) -> Self {
        if let tabBar = tabRouter.item(for: flowController) {
            customizationHandler(tabBar)
        }
        return self
    }
    
    func apply() {
        
    }
    
}

class TabRouter: NSObject {
    
    let tabBarController: UITabBarController
    
    init(on tabBarController: UITabBarController, with flowControllers: [FlowController]) {
        self.tabBarController = tabBarController
        super.init()
        let viewControllers = flowControllers.map { flowController -> UINavigationController in
            flowController.start()
            return flowController.router.navigationController
        }
        tabBarController.delegate = self
        tabBarController.setViewControllers(viewControllers, animated: true)
    }
    
    func select(_ flowController: FlowController) {
        
    }
    
    func item(for flowController: FlowController) -> UITabBarItem? {
        let controller = flowController.router.navigationController
        if let index = tabBarController.viewControllers?.index(of: controller) {
            return tabBarController.tabBar.items?[index]
        }
        return nil
    }
    
}

extension TabRouter: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let fromView = tabBarController.selectedViewController?.view,
            let toView = viewController.view,
            (fromView != toView) else {
                return false
        }
        UIView.transition(from: fromView,
                          to: toView,
                          duration: 0.2,
                          options: .transitionCrossDissolve,
                          completion: nil)
        return true
    }
    
}
