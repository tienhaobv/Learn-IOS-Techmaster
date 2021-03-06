//
//  MainScreen.swift
//  Tetris
//
//  Created by apple on 6/13/19.
//  Copyright © 2019 Hào. All rights reserved.
//

import UIKit

class MainScreen: UIViewController {
    
    var arBlock = Set<Block>()
//    var arrayHint = [[Int]]()
    var columnHint = 10
    var rowHint = 22
    var margin : CGFloat = 2.0
    var blockHint = [[BlockHint]]()
    var groupBlock: UIView!
    var timer: Timer!
    var sizeMoveBlock: CGFloat = 0.0
//    var minColumnX = 0.0
    var minColumnY : CGFloat = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // đổi màu backgroud
        self.view.backgroundColor = .black
        // gọi hàm tạo mảng hint
        createBlockHint()
        
        sizeMoveBlock = blockHint[1][columnHint/2-1].bounds.height + margin
        
        drawI(size: sizeMoveBlock)
        
        // in ra tất cả thằng con của thằng groupBlock
        // print(groupBlock.subviews.count)
    }
    // tạo ra mảng Hint bên dưới và căn chỉnh cho vào giữa màn hình
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
//            var arSubBlock = Array<Int>()
            for j in 0..<columnHint {
//                arSubBlock.append(0)
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
                subBlockHint.type = 3
                subBlockHint.setTypeColor()
                view.addSubview(subBlockHint)
                blockHintRow.append(subBlockHint)
            }
//            arBlock.append(arSubBlock)
            blockHint.append(blockHintRow)
        }
        
        var count = 0
        for i in blockHint
        {
            count += 1
            i[0].type = 1
            i[0].setTypeColor()
            i[i.count-1].type = 1
            i[i.count-1].setTypeColor()
            if count == blockHint.count {
                for j in 1..<i.count-1 {
                    i[j].type = 1
                    i[j].setTypeColor()
                }
            }
            
        }
        
    }
    
    func drawI(size: CGFloat){
        // tạo ra groupBlock để chứa những thằng block con rơi xuống
        groupBlock = UIView()
        groupBlock.frame = CGRect(x: blockHint[1][columnHint/2 - 1].frame.origin.x, y: blockHint[1][columnHint/2 - 1].frame.origin.y, width: blockHint[1][columnHint/2-1].bounds.width, height: blockHint[1][columnHint/2-1].bounds.height * 3 + margin * 2)
        groupBlock.backgroundColor = .green
        groupBlock.alpha = 0.5
        view.addSubview(groupBlock)
        //tạo ra những khổi block con bên trong
        for i in 0...2{
            if i == 1 {
                for j in 0...2 {
                    drawBlock(col: i, row: j, radius: size)
                }
            }
        }
        minColumn(column: columnHint/2 - 1)
        // hàm gọi di chuyển khối groupBlock
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(groupBlockLoop), userInfo: nil, repeats: true)
    }
    
    func drawBlock(col: Int, row: Int, radius: CGFloat) {
        let block = Block(_center: CGPoint(x: CGFloat(col + 1), y: radius * CGFloat(row)), _radius: radius, _fillColor: UIColor.orange)
        block.vtx = columnHint/2 - 1
        block.vty = row
        arBlock.insert(block)
        groupBlock.addSubview(block)
    }
    
    @objc func groupBlockLoop(){
        groupBlock.frame.origin.y += sizeMoveBlock
        for i in arBlock {
            if i.frame.origin.y >= minColumnY {
                timer.invalidate()
                drawI(size: sizeMoveBlock)
                break
            }
        }
    }
    func minColumn (column: Int) {
        for i in blockHint  {
            if i[column].type != 3 {
                minColumnY = i[column].frame.origin.y - sizeMoveBlock
            }
        }
    }
    
}
