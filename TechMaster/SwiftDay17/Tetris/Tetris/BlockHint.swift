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
        // Anh sử dụng ngôn ngữ Swift chất phác quá.
        // Hạ sách dùng if then else
        // Trung sách dùng switch case
        /* switch type {
        case 1:
        case 2:
        case 3:
            
        } */
        
        // Thượng sách
        let colorset = [UIColor.black, UIColor.red, UIColor.blue, UIColor.green]
        self.backgroundColor = colorset[type]
        /*
        if type == 1 {
            self.backgroundColor = .gray
        }
        else if type == 2 {
            self.backgroundColor = .red
        }
        else if type == 0 {
            self.backgroundColor = .black
            self.alpha = 0
        }*/
    }

}
