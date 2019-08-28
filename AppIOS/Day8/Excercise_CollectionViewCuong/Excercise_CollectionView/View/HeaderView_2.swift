//
//  HeaderView_2.swift
//  Excercise_CollectionView
//
//  Created by Cuong  Pham on 8/27/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import UIKit
import Stevia

class HeaderView_2: UIView {
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.text = "My Podcasts"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.sizeToFit()
        return label
    }()
    
    lazy var dotButton : UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "3-dots"), for: .normal)
        return button
    }()
    
    fileprivate func setUpLayout(){
        self.sv(titleLabel, dotButton)
        titleLabel.Leading == self.Leading + 5
        titleLabel.centerVertically()
        
        dotButton.Trailing == self.Trailing - 5
        dotButton.centerVertically().size(35)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
