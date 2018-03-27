//
//  AppDelegate.swift
//  Template
//
//  Created by Nguyen Quang Manh on 3/15/18.
//  Copyright © 2018 Vinmas. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let homeViewController = TestViewController()
        navigationController = UINavigationController(rootViewController: homeViewController)
        navigationController?.isNavigationBarHidden = true
        window?.rootViewController = navigationController
        
        window?.makeKeyAndVisible()
        
        return true
    }

}

