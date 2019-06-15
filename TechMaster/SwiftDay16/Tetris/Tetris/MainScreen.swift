//
//  MainScreen.swift
//  Tetris
//
//  Created by apple on 6/13/19.
//  Copyright © 2019 Hào. All rights reserved.
//

import UIKit

class MainScreen: UIViewController {
    
    var arrayHint = [[Int]]()
    var columnHint = 10
    var rowHint = 22
    var margin : CGFloat = 2.0
    var blockHint = [[BlockHint]]()
    var groupBlock: UIView!
    var timer: Timer!
    var sizeMoveBlock: CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        createBlockHint()
        groupBlock = UIView()
        groupBlock.frame = CGRect(x: blockHint[1][columnHint/2 - 1].frame.origin.x, y: blockHint[1][columnHint/2 - 1].frame.origin.y, width: blockHint[1][columnHint/2-1].bounds.width, height: blockHint[1][columnHint/2-1].bounds.height * 3 + margin * 2)
        sizeMoveBlock = blockHint[1][columnHint/2-1].bounds.height + margin
        groupBlock.backgroundColor = .green
        groupBlock.alpha = 0.5
        view.addSubview(groupBlock)
        drawI(size: sizeMoveBlock)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(moveGroupBlock), userInfo: nil, repeats: true)
    }
    
    func createBlockHint() {
        let sizeBlockHint = CGFloat.minimum((view.bounds.height - 60 - CGFloat(rowHint+1) * margin) / CGFloat(rowHint), (view.bounds.height - CGFloat(columnHint+1) * margin) / CGFloat(columnHint))
        let maginWidth = view.bounds.width - (sizeBlockHint * CGFloat(columnHint) + CGFloat(columnHint+1) * margin)
        let maginHeight = view.bounds.height - 60 - (sizeBlockHint * CGFloat(rowHint) + CGFloat(rowHint+1) * margin)
        let maxMagin = max(maginWidth, maginHeight)
        var isWidth : Bool = false
        
        if maginWidth == maxMagin {
            isWidth = true
        }
        
        for i in 0..<rowHint {
            var blockHintRow = [BlockHint]()
            for j in 0..<columnHint {
                let subBlockHint = BlockHint()
                if isWidth {
                    subBlockHint.frame = CGRect(x: maxMagin/2 + margin * CGFloat(j + 1) + sizeBlockHint * CGFloat(j),
                                                y: 40.0 + margin * CGFloat(i + 1) + sizeBlockHint * CGFloat(i),
                                                width: sizeBlockHint,
                                                height: sizeBlockHint)
                }
                else {
                    subBlockHint.frame = CGRect(x: margin * CGFloat(j + 1) + sizeBlockHint * CGFloat(j),
                                                y: maxMagin + 40.0 + margin * CGFloat(i + 1) + sizeBlockHint * CGFloat(i),
                                                width: sizeBlockHint,
                                                height: sizeBlockHint)
                }
                //subBlockHint.backgroundColor = .gray
                //subBlockHint.alpha = 40
                subBlockHint.type = 1
                subBlockHint.setTypeColor()
                view.addSubview(subBlockHint)
                blockHintRow.append(subBlockHint)
            }
            blockHint.append(blockHintRow)
        }
        
    }
    
    func drawI(size: CGFloat){
        for i in 0...2{
            if i == 1 {
                for j in 0...2 {
                    drawBlock(col: i, row: j, radius: size)
                }
            }
        }
    }
    
    func drawBlock(col: Int, row: Int, radius: CGFloat) {
        let block = Block(_center: CGPoint(x: radius * CGFloat(col + 1), y: radius * 2 * CGFloat(row)), _radius: radius, _fillColor: UIColor.orange)
        groupBlock.addSubview(block)
    }
    
    @objc func moveGroupBlock(){
        groupBlock.frame.origin.y += sizeMoveBlock
    }
    
}
