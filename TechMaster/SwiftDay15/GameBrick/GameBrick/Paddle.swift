//
//  Paddle.swift
//  GameBrick
//
//  Created by apple on 6/10/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class Paddle: UIView {

    convenience init() {
        self.init(frame: CGRect(x: 0.0, y: 0.0, width: 70.0, height: 20.0))
        backgroundColor = .white
    }

}
