//
//  nextBrick.swift
//  NewGameTeris
//
//  Created by Ba Thoc on 6/27/19.
//  Copyright © 2019 Ba Thoc. All rights reserved.
//

import UIKit

class NextBrick: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.green.withAlphaComponent(0.5)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
