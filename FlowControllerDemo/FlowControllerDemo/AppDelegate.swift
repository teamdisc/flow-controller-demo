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
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        UIApplication.shared.statusBarStyle = .default
        
        // setup application's appearance
        let navigationBarAppearance = UINavigationBar.appearance()
        navigationBarAppearance.backgroundColor = .clear
        navigationBarAppearance.barTintColor = Color.cloudWhite
        navigationBarAppearance.tintColor = UIColor.white
        navigationBarAppearance.titleTextAttributes = [NSForegroundColorAttributeName: Color.cloudWhite]
        
        UIButton.appearance().layer.cornerRadius = 4
        
        let navigationController = UINavigationController()
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isTranslucent = true
        
        let hotelSearchFlowController = HotelSelectionFlowController()
        hotelSearchFlowController.start(on: navigationController)
        
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        return true
    }
    
}
