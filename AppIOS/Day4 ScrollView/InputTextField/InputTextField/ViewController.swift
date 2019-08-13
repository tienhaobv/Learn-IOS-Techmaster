//
//  ViewController.swift
//  InputTextField
//
//  Created by Taof on 8/8/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    var y: CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // đăng kí nhận thông báo với hệ thống khi bàn phím ẩn - hiện
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
//        textField.becomeFirstResponder()
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapView(_:)))
        view.addGestureRecognizer(gesture)
    }

    @objc func tapView(_ gesture: UITapGestureRecognizer) {
        self.textField.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
        
        var keyboardHeight: CGFloat
        if #available(iOS 11.0, *) {
            keyboardHeight = keyboardFrame.cgRectValue.height - self.view.safeAreaInsets.bottom
        } else {
            keyboardHeight = keyboardFrame.cgRectValue.height
        }
        
        y = keyboardHeight
        UIView.animate(withDuration: 0.5) {
            self.view.frame.origin.y -= self.y
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 1) {
            self.view.frame.origin.y += self.y
        }
    }
}


