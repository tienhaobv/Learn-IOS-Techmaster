//
//  DescriptionView.swift
//  CheesePizza
//
//  Created by Tào Quỳnh on 5/21/19.
//  Copyright © 2019 Tào Quỳnh. All rights reserved.
//

import UIKit
import Stevia

class DescriptionView: UIView {
    
    let textView: UITextView = {
       let textView = UITextView()
        textView.backgroundColor = UIColor.clear
        textView.text = "I want to have extra cheese"
        textView.textColor = UIColor.lightGray
        textView.layer.borderWidth = 1.0
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.cornerRadius = 6.0
        return textView
    }()

    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        self.sv(textView)
        
        self.layout(
            0,
            |-0-textView-0-| ~ 100,
            0
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension DescriptionView: UITextViewDelegate{
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = ""
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "I want to have extra cheese"
            textView.textColor = UIColor.lightGray
        }
    }
}
