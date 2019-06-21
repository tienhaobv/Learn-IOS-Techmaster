//
//  Brick.swift
//  TetrisPoint
//
//  Created by Taof on 6/18/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation
import UIKit

// Khai báo một hàm kiểu enum, có các case là kiểu các khối hình: I, J, L, T, Z, S, O
enum BrickType {
    case i(UIColor)
    case j(UIColor)
    case l(UIColor)
    case t(UIColor)
    case z(UIColor)
    case s(UIColor)
    case o(UIColor)
}

class Brick {
    // khai báo một mảng CGPoint
    var points = [CGPoint]()
    
    // trục x, y, brick bắt đầu xuất hiện ở cột thứ 4, hàng 0
    var tx: Int = 4
    var ty: Int = 0
    
    var color = UIColor.clear
    var brickType = Brick.bricks[0]
    
    // khai báo mảng brick có 7 phần tử là 7 BrickType
    static var bricks = [
        BrickType.i(UIColor(red:1.00, green:0.80, blue:0.00, alpha:1.0)),
        BrickType.j(UIColor(red:0.20, green:0.60, blue:1.00, alpha:1.0)),
        BrickType.l(UIColor(red:0.20, green:0.80, blue:0.20, alpha:1.0)),
        BrickType.t(UIColor(red:0.80, green:0.00, blue:1.00, alpha:1.0)),
        BrickType.z(UIColor(red:0.00, green:0.60, blue:0.60, alpha:1.0)),
        BrickType.s(UIColor(red:1.00, green:0.80, blue:1.00, alpha:1.0)),
        BrickType.o(UIColor(red:1.00, green:0.60, blue:0.60, alpha:1.0))
    ]
    
    // Khởi tạo brick
    // Vẽ chữ bằng toạ độ x, y trong CGPoint, tương tự toạ độ trên trục toạ độ
    init(_ brickType: BrickType) {
        self.brickType = brickType
        switch brickType {
        case BrickType.i(let color):
            self.color = color
            self.points.append(CGPoint(x: 0, y: 0))
            self.points.append(CGPoint(x: 0, y: 1))
            self.points.append(CGPoint(x: 0, y: 2))
            self.points.append(CGPoint(x: 0, y: 3))
        case BrickType.j(let color):
            self.color = color
            self.points.append(CGPoint(x: 1, y: 0))
            self.points.append(CGPoint(x: 1, y: 1))
            self.points.append(CGPoint(x: 1, y: 2))
            self.points.append(CGPoint(x: 0, y: 2))
        case BrickType.l(let color):
            self.color = color
            self.points.append(CGPoint(x: 0, y: 0))
            self.points.append(CGPoint(x: 0, y: 1))
            self.points.append(CGPoint(x: 0, y: 2))
            self.points.append(CGPoint(x: 1, y: 2))
        case BrickType.t(let color):
            self.color = color
            self.points.append(CGPoint(x: 0, y: 0))
            self.points.append(CGPoint(x: 1, y: 0))
            self.points.append(CGPoint(x: 2, y: 0))
            self.points.append(CGPoint(x: 1, y: 1))
        case BrickType.z(let color):
            self.color = color
            self.points.append(CGPoint(x: 1, y: 0))
            self.points.append(CGPoint(x: 0, y: 1))
            self.points.append(CGPoint(x: 1, y: 1))
            self.points.append(CGPoint(x: 0, y: 2))
        case BrickType.s(let color):
            self.color = color
            self.points.append(CGPoint(x: 0, y: 0))
            self.points.append(CGPoint(x: 0, y: 1))
            self.points.append(CGPoint(x: 1, y: 1))
            self.points.append(CGPoint(x: 1, y: 2))
        case BrickType.o(let color):
            self.color = color
            self.points.append(CGPoint(x: 0, y: 0))
            self.points.append(CGPoint(x: 0, y: 1))
            self.points.append(CGPoint(x: 1, y: 0))
            self.points.append(CGPoint(x: 1, y: 1))
            
        }
    }
}
