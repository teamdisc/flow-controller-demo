//
//  Router.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/26/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

class Router {
    
    let navigationController: UINavigationController
    
    private(set) var viewControllers = [UIViewController]()
    
    var onDismiss: (()->Void)?
    
    var rootViewController: UIViewController? {
        return viewControllers.first
    }
    
    init(on navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    //todo:- push(_ pushable: Pushable) instead?
    
    func push(_ viewController: UIViewController, animated: Bool = true) {
        assert(!viewControllers.contains(viewController), "pushing the same view controller twice is not allowed")
        
        //todo:- check for other cases when deinited
        // when popped, remove the view controller itself from the stack
        viewController.onDeinit = { [weak self] in
            self?.viewControllers.removeLast()
        }
        navigationController.pushViewController(viewController, animated: animated)
        viewControllers.append(viewController)
    }
    
    func pop(animated: Bool = true) -> UIViewController? {
        viewControllers.removeLast()
        return navigationController.popViewController(animated: animated)
    }
    
    func present() {
        
    }
    
    func dismiss(animated: Bool = true) {
        let wasPresented = (navigationController.presentingViewController != nil)
            && (navigationController.viewControllers.count == viewControllers.count)
        if wasPresented {
            
        } else {
            
        }
    }
    
    //todo:- test needed!
    
    func setViewControllers(_ viewControllers: [UIViewController], animated: Bool = true) {
        var currentViewControllers = navigationController.viewControllers
        guard (viewControllers.count > 0),
            let firstIndex = currentViewControllers.index(of: viewControllers.first!),
            let lastIndex = currentViewControllers.index(of: viewControllers.last!) else { return }
        currentViewControllers.replaceSubrange(firstIndex...lastIndex, with: viewControllers)
        navigationController.setViewControllers(currentViewControllers, animated: animated)
    }
    
}
