//
//  StepView.swift
//  CheesePizza
//
//  Created by Tào Quỳnh on 5/22/19.
//  Copyright © 2019 Tào Quỳnh. All rights reserved.
//

import UIKit
import Stevia

class StepView: UIView {

    let backButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.layer.cornerRadius = 15
        button.setImage(UIImage(named: "back"), for: .normal)
        
        return button
    }()
    
    let stepLabel: UILabel = {
        let label = UILabel()
        label.text = "STEP 1"
        label.textAlignment = .center
        label.textColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    let shoppingButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .red
        button.layer.cornerRadius = 15
        button.setImage(UIImage(named: "shopping-bag"), for: .normal)
        
        return button
    }()
    
    let circleView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.yellow
        view.layer.cornerRadius = 4
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        self.sv(
            backButton, stepLabel, shoppingButton.sv(circleView)
        )
        
        self.layout(
            0,
            |-0-backButton.size(30)-stepLabel-shoppingButton.size(30)-0-|,
            0
        )
        
        shoppingButton.layout(
            0,
            |-(>=1)-circleView.size(8)-0-|
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
