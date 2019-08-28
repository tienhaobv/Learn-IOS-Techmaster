//
//  HeaderView_1.swift
//  Excercise_CollectionView
//
//  Created by Cuong  Pham on 8/26/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import UIKit
import Stevia

class HeaderView_1: UIView {
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Feature"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = .white
        label.sizeToFit()
        return label
    }()
    
    lazy var searchButton : UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "search"), for: .normal)
        return button
    }()
    
    fileprivate func setUpLayout(){
        self.sv(titleLabel, searchButton)
        self.backgroundColor = .clear
        
        titleLabel.Leading == self.Leading + 5
        titleLabel.centerVertically()
        
        searchButton.size(35).centerVertically()
        searchButton.Trailing == self.Trailing - 5
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
