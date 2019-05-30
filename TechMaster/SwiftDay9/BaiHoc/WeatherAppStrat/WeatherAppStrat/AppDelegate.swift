//
//  AppDelegate.swift
//  WeatherAppStrat
//
//  Created by Ngô Hào on 5/21/19.
//  Copyright © 2019 Ngô Hào. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // đây chỉ là khai báo chưa phải kà khởi tạo
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // đây mới là khởi tạo biến
        window = UIWindow(frame: UIScreen.main.bounds)
        
        let mainWeather = MainWeatherController(nibName: "MainWeatherController", bundle: nil)
        // đổ vào root này là cái để chạy đầu tiên
        window?.rootViewController = mainWeather
        // hiển thị cái window đó lên
        window?.makeKeyAndVisible()
        return true
    }

}

