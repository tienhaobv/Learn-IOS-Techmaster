//
//  ViewController.swift
//  GameBrick
//
//  Created by apple on 6/10/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var screenWidth: CGFloat = 0
    var screenHeight: CGFloat = 0
    var squareWidth: CGFloat = 0
    var margin: CGFloat = 4.0
    let max = 7
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpControl()
    }
    
    func setUpControl() {
        screenWidth = self.view.bounds.width
        screenHeight = self.view.bounds.height
        squareWidth = (self.view.bounds.width - margin * 2.0) / CGFloat(max + 1)
        self.view.backgroundColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1.0)
        
        for row in 0..<3{
            for col in 0...max {
                let isWhiteSquare = (row + col) % 2 == 1 ? true: false
                drawSquare(isWhite: isWhiteSquare, row: row, col: col)
            }
        }
    }
    func drawSquare(isWhite: Bool, row: Int, col: Int) {
        
        let topleft = computeTopLeftPosition(row: row, col: col, width: squareWidth)
        
        let square = UIView(frame: CGRect(x: topleft.x, y: topleft.y, width: squareWidth, height: squareWidth))
        
        let rd = Int.random(in: 0...2)
        if rd == 0 {
            square.backgroundColor =  UIColor.red
        }
        else if rd == 1 {
            square.backgroundColor =  UIColor.green
        }
        else {
            square.backgroundColor =  UIColor.blue
        }
        self.view.addSubview(square)
    }
    
    func computeTopLeftPosition(row: Int, col: Int, width: CGFloat) -> (x: CGFloat, y: CGFloat) {
        return (margin + CGFloat(col) * width, 100 + CGFloat(row) * width)
    }


}

