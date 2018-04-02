//
//  AppDelegate.swift
//  Template
//
//  Created by Nguyen Quang Manh on 3/15/18.
//  Copyright © 2018 Vinmas. All rights reserved.
//

import UIKit
import ESTabBarController_swift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?
    static let shared = UIApplication.shared.delegate as? AppDelegate

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        var viewController = UIViewController()
        if UserDefaults.standard.bool(forKey: AppConfig.FirstTimeUserDefault) == false {
            // is first time
            viewController = IntroduceViewController()
            UserDefaults.standard.set(true, forKey: AppConfig.FirstTimeUserDefault)
            window?.rootViewController = viewController
            window?.makeKeyAndVisible()
        } else {
            // is not first
            setupTabBar()
        }

        return true
    }

    
    func setupTabBar() {
        
        // Setup Tabbar Controller
        
        let tabbarController = ESTabBarController()
//        tabBarController.delegate = delegate
        tabbarController.tabBar.barTintColor = Colors.MainColor
        
        // setup action for center button
        tabbarController.shouldHijackHandler = {
            tabbarController, viewController, index in
            if index == 2 {
                return true
            }
            return false
        }
        tabbarController.didHijackHandler = {
            [weak tabbarController] tabBarController, viewController, index in
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                let alertController = UIAlertController.init(title: nil, message: nil, preferredStyle: .actionSheet)
                let takePhotoAction = UIAlertAction(title: "Take a photo", style: .default, handler: nil)
                alertController.addAction(takePhotoAction)
                let selectFromAlbumAction = UIAlertAction(title: "Select from album", style: .default, handler: nil)
                alertController.addAction(selectFromAlbumAction)
                let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
                alertController.addAction(cancelAction)
                tabbarController?.present(alertController, animated: true, completion: nil)
            }
        }
        
        
        let homeViewController = HomeViewController()
        let homeItem = ESTabBarItem(TabBarItemContentView(), title: "Home", image: #imageLiteral(resourceName: "ic_tb_home"), selectedImage: #imageLiteral(resourceName: "ic_tb_home"), tag: 0)
        homeViewController.tabBarItem = homeItem
        
        let locationViewController = LocationViewController()
        let locationItem = ESTabBarItem(TabBarItemContentView(), title: "Định vị", image: #imageLiteral(resourceName: "ic_tb_location"), selectedImage: #imageLiteral(resourceName: "ic_tb_location"), tag: 1)
        locationViewController.tabBarItem = locationItem
        
        let bookViewController = BookViewController()
        let bookItem = ESTabBarItem(IrregularityTabBarItemContentView(), title: nil, image: #imageLiteral(resourceName: "ic_tb_center"), selectedImage:#imageLiteral(resourceName: "ic_tb_center"), tag: 2)
        bookViewController.tabBarItem = bookItem

        let historyViewController = HistoryViewController()
        let historyItem = ESTabBarItem(TabBarItemContentView(), title: "Lịch sử", image: #imageLiteral(resourceName: "ic_tb_history"), selectedImage: #imageLiteral(resourceName: "ic_tb_history"), tag: 3)
        historyViewController.tabBarItem = historyItem

        let moreViewController = MoreViewController()
        let moreItem = ESTabBarItem(TabBarItemContentView(), title: "Thêm", image: #imageLiteral(resourceName: "ic_tb_more"), selectedImage: #imageLiteral(resourceName: "ic_tb_more"), tag: 4)
        moreViewController.tabBarItem = moreItem

        
        tabbarController.viewControllers = [homeViewController, locationViewController, bookViewController, historyViewController, moreViewController]
        window?.rootViewController = tabbarController
        window?.makeKeyAndVisible()
    }
}

