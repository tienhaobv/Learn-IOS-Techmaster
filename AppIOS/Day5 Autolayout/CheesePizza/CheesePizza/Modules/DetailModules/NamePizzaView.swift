//
//  NamePizzaView.swift
//  CheesePizza
//
//  Created by Tào Quỳnh on 5/21/19.
//  Copyright © 2019 Tào Quỳnh. All rights reserved.
//

import UIKit
import Stevia

class NamePizzaView: UIView {
    
    let nameTextField: UITextField = {
       let textField = UITextField()
        textField.text = "YOUR PIZZA NAME"
        textField.textAlignment = .center
        textField.textColor = .gray
        return textField
    }()
    
    let editButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "edit"), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        self.sv(
            nameTextField,
            editButton
        )
        
        self.layout(
            0,
            |-(>=1)-nameTextField.width(150)-2-editButton-(>=1)-|,
            0
        )
        nameTextField.centerHorizontally()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
