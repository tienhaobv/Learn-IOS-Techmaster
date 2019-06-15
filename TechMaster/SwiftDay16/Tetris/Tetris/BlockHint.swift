//
//  BlockHint.swift
//  Tetris
//
//  Created by apple on 6/14/19.
//  Copyright © 2019 Hào. All rights reserved.
//

import UIKit

class BlockHint: UIView {
    var type : Int = 0
    convenience init() {
        self.init(frame: CGRect.zero)
        self.alpha = 1
    }
    func setTypeColor() {
        if type == 1 {
            self.backgroundColor = .gray
        }
        else if type == 2 {
            self.backgroundColor = .red
        }
        else if type == 0 {
            self.backgroundColor = .black
            self.alpha = 0
        }
    }

}
