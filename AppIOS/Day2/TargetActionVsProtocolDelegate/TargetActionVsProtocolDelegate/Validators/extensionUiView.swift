//
//  File.swift
//  TargetActionVsProtocolDelegate
//
//  Created by Ba Thoc on 8/5/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func findViewController() -> UIViewController? {
        if let nextResponder = self.next as? UIViewController {
            return nextResponder
        } else if let nextResponder = self.next as? UIView {
            return nextResponder.findViewController()
        } else {
            return nil
        }
    }
}

extension UIView {
    func findAnsetorView() -> UIView? {
        if self.superview == nil {
            return self
        } else if let nextResponder = self.superview {
            return nextResponder.findAnsetorView()
        } else {
            return nil
        }
    }
}
