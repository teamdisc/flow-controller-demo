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
        setupAppearance()
        
        let navigationController = UINavigationController()
        navigationController.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController.navigationBar.shadowImage = UIImage()
        navigationController.navigationBar.isTranslucent = true
        navigationController.navigationBar.backItem?.backBarButtonItem?.title = "c"
        navigationController.navigationItem.backBarButtonItem?.title = "a"
        
        let hotelSearchFlowController = HotelSelectionFlowController()
        hotelSearchFlowController.start(on: navigationController)
        
        self.window?.rootViewController = navigationController
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
        
        // bar button appearance
        let barButtonItemAppearance = UIBarButtonItem.appearance()
        barButtonItemAppearance.setTitleTextAttributes([
            NSForegroundColorAttributeName: UIColor.white,
            NSFontAttributeName: Font.medium(of: 16)
            ], for: .normal)
        
        UIButton.appearance().cornerRadius = 4
    }
    
}
