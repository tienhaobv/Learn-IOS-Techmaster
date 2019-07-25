//
//  UIDevice + Extension.swift
//  MemoryGame_Final
//
//  Created by Cuong  Pham on 7/12/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import Foundation
import UIKit
extension UIDevice {
    static func setSixe(iPhone : CGFloat, iPad : CGFloat) -> CGFloat {
        switch UIDevice.current.userInterfaceIdiom {
        case .phone:
            return iPhone
        case .pad:
            return iPad
        default:
            return 0
        }
    }
}
