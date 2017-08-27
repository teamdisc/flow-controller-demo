//
//  Router.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/26/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

class Router: NSObject {
    
    let navigationController: UINavigationController
    
    fileprivate(set) var viewControllers = [UIViewController]()
    
    //todo:- delegate and make base flow controller listen to this instead?
    var onDismiss: (()->Void)?
    
    var rootViewController: UIViewController? {
        return viewControllers.first
    }
    
    init(on navigationController: UINavigationController) {
        self.navigationController = navigationController
        super.init()
        self.navigationController.delegate = self
    }
    
    //todo:- push(_ pushable: Pushable) instead?
    
    func push(_ viewController: UIViewController, animated: Bool = true) {
        assert(!viewControllers.contains(viewController), "pushing the same view controller twice is not allowed")
        navigationController.pushViewController(viewController, animated: animated)
        viewControllers.append(viewController)
    }
    
    //todo:- test needed!
    
    func pop(animated: Bool = true) -> UIViewController? {
//        viewControllers.removeLast()
        return navigationController.popViewController(animated: animated)
    }
    
    func present() {
        
    }
    
    func dismiss(animated: Bool = true) {
        let wasPresented = (navigationController.presentingViewController != nil)
            && (navigationController.viewControllers.count == viewControllers.count)
        if wasPresented {
            navigationController.dismiss(animated: animated, completion: onDismiss)
        } else {
            setViewControllers([], animated: animated)
        }
        onDismiss?()
    }
    
    //todo:- test needed!
    
    func setViewControllers(_ viewControllers: [UIViewController], animated: Bool = true) {
        var currentViewControllers = navigationController.viewControllers
        guard (self.viewControllers.count > 0),
            let firstIndex = currentViewControllers.index(of: self.viewControllers.first!),
            let lastIndex = currentViewControllers.index(of: self.viewControllers.last!) else { return }
        currentViewControllers.replaceSubrange(firstIndex...lastIndex, with: viewControllers)
        navigationController.setViewControllers(currentViewControllers, animated: animated)
        self.viewControllers = viewControllers
    }
    
}

extension Router: UINavigationControllerDelegate {
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from),
            !navigationController.viewControllers.contains(fromViewController) else { return }
        cleanUp()
        if viewControllers.count == 0 {
            onDismiss?()
        }
    }
    
    private func cleanUp() {
        while (viewControllers.count > 0) && !isTopViewControllerInSync {
            viewControllers.removeLast()
        }
    }
    
    private var isTopViewControllerInSync: Bool {
        return navigationController.viewControllers.last == viewControllers.last
    }
    
}
