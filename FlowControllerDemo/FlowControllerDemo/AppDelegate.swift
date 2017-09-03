//
//  AppDelegate.swift
//  FlowControllerDemo
//
//  Created by Pirush Prechathavanich on 8/24/17.
//  Copyright © 2017 Pirush Prechathavanich. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    private var applicationFlowController: ApplicationFlowController!
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        setupAppearance()
        
        let createNavigationController = { () -> UINavigationController in
            let navigationController = UINavigationController()
            navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationController.navigationBar.shadowImage = UIImage()
            navigationController.navigationBar.isTranslucent = true
            return navigationController
        }
        
        let hotelSelectionFlowController = HotelSelectionFlowController(on: createNavigationController())
        let promotionFlowController = PromotionFlowController(on: createNavigationController())
        
        let flowControllers = [hotelSelectionFlowController, promotionFlowController]
        applicationFlowController = ApplicationFlowController(on: UITabBarController(), with: flowControllers)
        
        applicationFlowController
            .customize(for: hotelSelectionFlowController) { tabBarItem in
                tabBarItem.title = "Booking"
                tabBarItem.image = #imageLiteral(resourceName: "icon-luggage").withRenderingMode(.alwaysOriginal)
            }.customize(for: promotionFlowController) { tabBarItem in
                tabBarItem.title = "Promotion"
                tabBarItem.image = #imageLiteral(resourceName: "icon-minibar").withRenderingMode(.alwaysOriginal)
            }.apply() //todo:- remove this, no implementation (just to shut the compiler up)
        
        
        self.window?.rootViewController = applicationFlowController.tabRouter.tabBarController
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
    private func setupAppearance() {
        // status bar appearance
        UIApplication.shared.statusBarStyle = .lightContent
        
        // navigation bar appearance
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.backgroundColor = .clear
        navigationBarAppearance.barTintColor = .white
        navigationBarAppearance.tintColor = .white
        navigationBarAppearance.titleTextAttributes = [
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: Font.demiBold(of: 16)
        ]
        
        // tab bar appearance
        let tabBarAppearance = UITabBar.appearance()
        tabBarAppearance.barTintColor = .clear
        tabBarAppearance.tintColor = .white
        tabBarAppearance.unselectedItemTintColor = UIColor.black.withAlphaComponent(0.25)
        tabBarAppearance.backgroundColor = .clear
        tabBarAppearance.backgroundImage = UIImage()
        tabBarAppearance.shadowImage = UIImage()
        
        // tab bar item appearance
        let barItemAppearance = UITabBarItem.appearance()
        barItemAppearance.setTitleTextAttributes([
            NSFontAttributeName: Font.medium(of: 9)
            ], for: .normal)
        
        // bar button appearance
        let barButtonItemAppearance = UIBarButtonItem.appearance()
        barButtonItemAppearance.setTitleTextAttributes([
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: Font.medium(of: 16)
            ], for: .normal)
        
        UIButton.appearance().cornerRadius = 4
    }
    
}
