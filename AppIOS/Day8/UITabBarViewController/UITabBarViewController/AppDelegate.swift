//
//  AppDelegate.swift
//  UITabBarViewController
//
//  Created by Ba Thoc on 8/26/19.
//  Copyright © 2019 Ba Thoc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        
//        let greenVC = GreenViewController()
//        let purpleVC = PurpleViewController()
        window?.rootViewController = setupUITabBarViewController()
        window?.makeKeyAndVisible()
        
        return true
    }
    
    func setupUITabBarViewController() -> UITabBarController {
        // khởi taoj một UITabBarViewController
        let tabBarVC = UITabBarController()
        
        // KHởi tạo màn GreenVC
        let greenVC = GreenViewController()
        greenVC.tabBarItem = UITabBarItem(title: "Green", image: nil, tag: 0)
        greenVC.tabBarItem.badgeValue = "5"
        greenVC.tabBarItem.badgeColor = .brown
        
        let purpleVC = PurpleViewController()
        purpleVC.tabBarItem = UITabBarItem(title: "Purple", image: nil, tag: 1)
        
        let yellowVC = YellowViewController()
        yellowVC.tabBarItem = UITabBarItem(title: "Yellow", image: nil, tag: 2)
        
        let redVC = RedViewController()
        redVC.tabBarItem = UITabBarItem(title: "Red", image: nil, tag: 3)
        
        let blueVC = BlueViewController()
        blueVC.tabBarItem = UITabBarItem(title: "Blue", image: nil, tag: 4)
        
        // set các viewcontroller vào tabBar
        tabBarVC.setViewControllers([greenVC, purpleVC, yellowVC, redVC, blueVC], animated: true)
        
        return tabBarVC
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

