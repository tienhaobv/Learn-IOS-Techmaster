//
//  ViewController.swift
//  GameWord
//
//  Created by Tung on 7/3/19.
//  Copyright © 2019 Tung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var path = UIBezierPath()
    var lastPoint = CGPoint.zero
    
    let topArea: CGFloat = 100

    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawBoard()
  
    }
    func drawBoard(){
        let width = view.frame.width / 7
        
        for i in 0..<7 {
            for j in 0...7{
                let cellView = UIView()
                
                cellView.frame = CGRect(x: CGFloat(j) * width, y: CGFloat(i) * width + topArea, width: width, height: width)
                cellView.layer.borderWidth = 0.5
                cellView.layer.borderColor = UIColor.black.cgColor
         
                view.addSubview(cellView)
   
            }
        }
    }
    
    func centerOfCell(point: CGPoint) -> CGPoint {
        let width = view.frame.width / 7
        let i = Int(point.x / width)
        let j = Int((point.y - topArea) / width)
        
        let x = CGFloat(i)*width + 0.5*width
        let y = CGFloat(j)*width + 0.5*width + topArea
        
        return CGPoint(x: x, y: y)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            lastPoint = touch.location(in: self.view)
            lastPoint = centerOfCell(point: lastPoint)
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            var currentPoint = touch.location(in: view)
            currentPoint = centerOfCell(point: currentPoint)
            
            drawLineFromPoint(start: lastPoint, toPoint: currentPoint, ofColor: .red, inView: view)
            lastPoint = touch.location(in: self.view)
            lastPoint = centerOfCell(point: lastPoint)
            
        }
    }
    
    func drawLineFromPoint(start : CGPoint, toPoint end:CGPoint, ofColor lineColor: UIColor, inView view:UIView) {
        
        path.move(to: start)
        UIView.animate(withDuration: 1) {
            self.path.addLine(to: end)
        }
        
        
        
        //design path in layer
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = lineColor.cgColor
        shapeLayer.lineWidth = 20
        shapeLayer.lineJoin = .round
        
        view.layer.addSublayer(shapeLayer)
    }
    
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        path.removeAllPoints()
    }

}

