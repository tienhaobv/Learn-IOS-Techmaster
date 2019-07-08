//
//  Brick.swift
//  NewGameTeris
//
//  Created by Ba Thoc on 6/27/19.
//  Copyright © 2019 Ba Thoc. All rights reserved.
//

import Foundation
import UIKit

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
    var points = [CGPoint]()
    
    var tx : Int = 4
    var ty : Int = 0
    
    var color = UIColor.clear
    var brickType = Brick.bricks[0]
    
    static var nextBricks = [Brick]()
    static var nextBrickCount = 3
    static var bricks = [
        BrickType.i(UIColor(red:1.00, green:0.50, blue:0.00, alpha:1.0)),
        BrickType.j(UIColor(red:1.00, green:0.00, blue:0.00, alpha:1.0)),
        BrickType.l(UIColor(red:0.00, green:1.00, blue:0.00, alpha:1.0)),
        BrickType.t(UIColor(red:1.00, green:0.00, blue:1.00, alpha:1.0)),
        BrickType.z(UIColor(red:1.00, green:1.00, blue:0.00, alpha:1.0)),
        BrickType.s(UIColor(red:1.00, green:0.80, blue:1.00, alpha:1.0)),
        BrickType.o(UIColor(red:0.00, green:0.00, blue:1.00, alpha:1.0))
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
    
    // Các hàm left(), right(), bottom(), top(): trả về các điểm trái, phải, trên, dưới của khối hình
    
    func left() -> CGPoint {
        var left = self.points[0]
        for p in self.points {
            if left.x > p.x {
                left = p
            }
        }
        return left
    }
    
    func right() -> CGPoint {
        var right = self.points[0]
        for p in self.points {
            if right.x < p.x {
                right = p
            }
        }
        return right
    }
    
    func bottom() -> CGPoint {
        var bottom = self.points[0]
        for p in self.points {
            if bottom.y < p.y {
                bottom = p
            }
        }
        return bottom
    }
    
    func top() -> CGPoint {
        var top = self.points[0]
        for p in self.points {
            if top.y > p.y {
                top = p
            }
        }
        return top
    }
    // dịch xuống
    func moveDown() {
        ty += 1
    }
    
    // dịch trái
    func moveLeft() {
        tx -= 1
    }
    
    // dịch phải
    func moveRight() {
        tx += 1
    }
    // xoay khối hình
    func rotatedPoints() -> [CGPoint] {
        switch self.brickType {
        case BrickType.o:
            return self.points
        default:
            var mx = self.points.reduce(CGFloat(0)) { (initValue: CGFloat, p: CGPoint) -> CGFloat in
                return initValue + p.x
            }
            
            var my = self.points.reduce(CGFloat(0)) { (initValue: CGFloat, p: CGPoint) -> CGFloat in
                return initValue + p.y
            }
            
            mx = CGFloat(Int(mx)/self.points.count)
            my = CGFloat(Int(my)/self.points.count)
            
            let sinX: CGFloat = 1
            let cosX: CGFloat = 0
            
            var rotatedBrick = [CGPoint]()
            
            for p in self.points {
                let r = p.y
                let c = p.x
                let x = (c - mx) * cosX - (r - my) * sinX
                let y = (c - mx) * sinX + (r - my) * cosX
                rotatedBrick.append(CGPoint(x: x, y: y))
            }
            
            return rotatedBrick
        }
    }
    
    // tạo một brick mới
    static func newBrick() -> Brick {
        let index = Int(arc4random_uniform(UInt32(self.bricks.count)))
        let brickType = bricks[index]
        let brick = Brick(brickType)
        return brick
    }
    
    // generate brick kế tiếp
    static func generate() -> Brick{
        while self.nextBricks.count < self.nextBrickCount {
            self.nextBricks.append(self.newBrick())
        }
        let brick = self.nextBricks.remove(at: 0)
        self.nextBricks.append(self.newBrick())
        return brick
    }
}
