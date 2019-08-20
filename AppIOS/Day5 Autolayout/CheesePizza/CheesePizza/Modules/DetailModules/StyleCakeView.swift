//
//  StyleCakeView.swift
//  CheesePizza
//
//  Created by Tào Quỳnh on 5/21/19.
//  Copyright © 2019 Tào Quỳnh. All rights reserved.
//

import UIKit
import Stevia

class StyleCakeView: UIView {

    let thickButton: UIButton = {
        let button = UIButton()
        button.setTitle("Thick", for: .normal)
        button.backgroundColor = UIColor.red
        button.layer.cornerRadius = 10
        return button
    }()
    
    let thinButton: UIButton = {
        let button = UIButton()
        button.setTitle("Thin", for: .normal)
        button.backgroundColor = UIColor.clear
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.layer.borderWidth = 1.0
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.cornerRadius = 10
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        self.sv(
            thickButton,
            thinButton
        )
        
        self.layout(
            0,
            |-0-thickButton-16-thinButton-0-|,
            0
        )
        
        thickButton.Width == thinButton.Width
        thickButton.Height == thinButton.Height
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
