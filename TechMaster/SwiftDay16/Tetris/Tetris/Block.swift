//
//  Block.swift
//  Tetris
//
//  Created by apple on 6/13/19.
//  Copyright © 2019 Hào. All rights reserved.
//

import UIKit

class Block: UIView {
    // kiểu biến để vẽ vật thể
    var blockLayer: CAShapeLayer!
    var radius: CGFloat = 0.0
    var fillColor: UIColor!

    convenience init(_center: CGPoint, _radius: CGFloat, _fillColor: UIColor) {
        self.init(frame: CGRect(x: _center.x, y: _center.y, width: _radius * 2.0, height: _radius * 2.0))
        // set giá trị _radius và _fillColor chuyền vào cho biến radius và fillColor bên ngoài
        self.radius = _radius
        self.fillColor = _fillColor
        self.alpha = 100
    }
    // hàn này dùng để vẽ nên vật thể
    override func draw(_ rect: CGRect) {
        // bắt buộc phải gọi super.draw(rect)
        super.draw(rect)
        if blockLayer == nil {
            // khởi tạo biến blockLayer để vẽ nó
            blockLayer = CAShapeLayer()
            // vẽ width và height cùng vị trí của nó bằng hàm UIBezierPath và nhớ kết thúc bằng .cgPath
            blockLayer.path = UIBezierPath(roundedRect: CGRect(x: 0.0, y: 0.0, width: self.frame.width, height: self.frame.height), cornerRadius: 0).cgPath
            // đổ màu cho blockLayer và đuôi .cgColor
            blockLayer.fillColor = fillColor.cgColor
            
            // khởi tạo biến chiều rộng của khối để vẽ chi tiết bên trong khối
            let width = self.frame.width
            // biến bo góc (góc bo bằng 1/10 chiều rộng của khối)
            let x = width/10
            // tạo ra một layer hình ảnh bo viền trên top và add vào hình block
            let topLayer = CAShapeLayer()
            // tạo ra biến UIBezierPath để vẽ đường bao cho layerTop
            let line = UIBezierPath()
            // bắt đầu vẽ từ vị trí x:0 y:0
            line.move(to: CGPoint(x: 0.0, y: 0.0))
            // bắt đầu đưa đường vẽ tới những điểm thích hợp
            line.addLine(to: CGPoint(x: width, y: 0.0))
            line.addLine(to: CGPoint(x: width - x, y: x))
            line.addLine(to: CGPoint(x: x, y: x))
            line.addLine(to: CGPoint(x: 0.0, y: 0.0))
            // add đường bao vừa vẽ xong vào hình topLayer
            topLayer.path = line.cgPath
            topLayer.opacity = 0.4
            topLayer.fillColor = UIColor.white.cgColor
            // insert vào block
            blockLayer.insertSublayer(topLayer, at: 0)
            
            // xoá đường kẻ cũ
            line.removeAllPoints()
            // vẽ các cạnh khác
            // bên phải
            let rightLayer = CAShapeLayer()
            line.move(to: CGPoint(x: width, y: 0.0))
            line.addLine(to: CGPoint(x: width, y: width))
            line.addLine(to: CGPoint(x: width - x, y: width - x))
            line.addLine(to: CGPoint(x: width - x, y: x))
            line.addLine(to: CGPoint(x: width, y: 0.0))
            rightLayer.path = line.cgPath
            rightLayer.opacity = 0.4
            rightLayer.fillColor = UIColor.brown.cgColor
            blockLayer.insertSublayer(rightLayer, at: 0)
            
            //bên trái
            line.removeAllPoints()
            let leftLayer = CAShapeLayer()
            line.move(to: CGPoint(x: 0.0, y: 0.0))
            line.addLine(to: CGPoint(x: x, y: x))
            line.addLine(to: CGPoint(x: x, y: width - x))
            line.addLine(to: CGPoint(x: 0.0, y: width))
            line.addLine(to: CGPoint(x: 0.0, y: 0.0))
            leftLayer.path = line.cgPath
            leftLayer.opacity = 0.4
            leftLayer.fillColor = UIColor.brown.cgColor
            blockLayer.insertSublayer(leftLayer, at: 0)
            
            //bên dưới
            line.removeAllPoints()
            let bottomLayer = CAShapeLayer()
            line.move(to: CGPoint(x: 0.0, y: width))
            line.addLine(to: CGPoint(x: x, y: width - x))
            line.addLine(to: CGPoint(x: width - x, y: width - x))
            line.addLine(to: CGPoint(x: width, y: width))
            line.addLine(to: CGPoint(x: 0.0, y: width))
            bottomLayer.path = line.cgPath
            bottomLayer.opacity = 0.4
            bottomLayer.fillColor = UIColor.brown.cgColor
            blockLayer.insertSublayer(bottomLayer, at: 0)
        }
        
    }

}
