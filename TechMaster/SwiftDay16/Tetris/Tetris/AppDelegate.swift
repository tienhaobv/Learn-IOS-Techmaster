//
//  AppDelegate.swift
//  Tetris
//
//  Created by apple on 6/13/19.
//  Copyright © 2019 Hào. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        guard let window = self.window else { fatalError("No Window") }
        
        window.rootViewController = MainScreen()
        
        // Make it visible
        window.makeKeyAndVisible()
        return true
    }

}

