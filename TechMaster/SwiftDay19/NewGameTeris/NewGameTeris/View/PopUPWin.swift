//
//  PopUP.swift
//  NewGameTeris
//
//  Created by Ba Thoc on 6/28/19.
//  Copyright © 2019 Ba Thoc. All rights reserved.
//

import UIKit

class PopUPWin: UIImageView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.image = UIImage(named: "youwin-1")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
