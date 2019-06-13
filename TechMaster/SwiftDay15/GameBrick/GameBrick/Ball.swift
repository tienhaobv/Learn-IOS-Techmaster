//
//  Ball.swift
//  GameBrick
//
//  Created by apple on 6/10/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class Ball: UIView {

    var radius: CGFloat!
    var vx: CGFloat = 0.0
    var vy: CGFloat = 0.0
    // R: CGFoat là giá trị chuyền vào để gọi hàm
    convenience init(R: CGFloat) {
        self.init(frame: CGRect(x: 0.0, y: 0.0, width: R * 2.0, height: R * 2.0))
        radius = R
        backgroundColor = .red
        self.layer.cornerRadius = R
    }

}
