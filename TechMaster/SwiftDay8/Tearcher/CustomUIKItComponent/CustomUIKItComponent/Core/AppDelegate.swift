//
//  AppDelegate.swift
//  BootStrap
//
//  Created by Techmaster on 3/19/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        // Garantiee the window in not nil
        guard let window = self.window else { fatalError("No Window") }
        
        BootLogic.boot(window: window)
        
        // Make it visible
        window.makeKeyAndVisible()
   
        return true
    }

    
}

