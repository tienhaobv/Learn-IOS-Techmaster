//
//  Brick.swift
//  GameBrick
//
//  Created by apple on 6/10/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class Brick: UIView {

    var hardness: Int!
    // dùng lại chính thằng mình đang dùng để chỉnh sửa kích thước hay màu sắc cho nó
    convenience init(){
        self.init(frame: CGRect.zero)
        hardness = Int.random(in: 1...4)
        alpha = CGFloat(hardness) / 4.0
    }

}
