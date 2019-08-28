//
//  ViewController.swift
//  GiaoDienUITabBarController
//
//  Created by Taof on 8/26/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.frame = CGRect(x: 100, y: 300, width: 200, height: 50)
        button.backgroundColor = UIColor.purple
        button.setTitle("Nút", for: .normal)
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(sangMan2), for: .touchUpInside)
    }

    @objc func sangMan2(){
        present(setupTabBarViewController(), animated: true, completion: nil)
    }
    func setupTabBarViewController() -> UITabBarController {
        // khởi tạo một UITabBarController
        let tabBarVC = UITabBarController()
        
        // khởi tạo màn chatViewController
        let chatVC = ChatViewController()
        let naviChat = UINavigationController(rootViewController: chatVC)
        chatVC.tabBarItem = UITabBarItem(title: "Chat", image: UIImage(named: "chat-blue"), tag: 0)
        chatVC.tabBarItem.badgeValue = "5"
        chatVC.tabBarItem.badgeColor = UIColor.orange
        
        let diaryVC = DiaryViewController()
        //        diaryVC.tabBarItem = UITabBarItem(title: "Diary", image: UIImage(named: "watch-blue"), tag: 2)
        
        diaryVC.tabBarItem = UITabBarItem(title: "Nhật ký", image: UIImage(named: "watch-blue"), selectedImage: UIImage(named: "chat-gray"))
        
        //        khởi tạo màn contactViewController
        let contactVC = ContactViewController()
        contactVC.tabBarItem = UITabBarItem(title: "Contact", image: UIImage(named: "contacts-blue"), tag: 1)
        contactVC.tabBarItem.badgeValue = "N"
        
        // set các viewController vào tabBar
        tabBarVC.setViewControllers([naviChat, contactVC, diaryVC], animated: true)
        
        return tabBarVC
    }


}

