//
//  Extension+UiViewController.swift
//  DemoSlideMenu
//
//  Created by Ba Thoc on 9/5/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    func setupSlideMenuItem() {
        self.addLeftBarButtonWithImage(UIImage(named: "menu")!)
        self.addRightBarButtonWithImage(UIImage(named: "menu")!)
    }
}
