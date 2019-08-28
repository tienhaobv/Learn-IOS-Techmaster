//
//  HeaderView.swift
//  Table_View
//
//  Created by Cuong  Pham on 8/20/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import UIKit
import Stevia

class HeaderView: UIView {
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Edit - Delete - Add"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.sizeToFit()
        return label
    }()
    
    lazy var addButton : UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "add-2"), for: .normal)
        return button
    }()
    
    fileprivate func autoLayoutHeaderView(){
        self.sv(titleLabel, addButton)
        self.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        titleLabel.centerInContainer()
        addButton.size(30).centerVertically()
        addButton.Trailing == self.Trailing - 10
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        autoLayoutHeaderView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
