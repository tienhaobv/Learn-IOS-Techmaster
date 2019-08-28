//
//  ChatViewController.swift
//  GiaoDienUITabBarController
//
//  Created by Taof on 8/26/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.green
        tabBarItem.title = "Trò chuyện"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(nextMan3))
    }
    
    @objc func nextMan3(){
        let fourVC = FourViewController()
        
        // ẩn tabBar
//        fourVC.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(fourVC, animated: true)
//        present(fourVC, animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
