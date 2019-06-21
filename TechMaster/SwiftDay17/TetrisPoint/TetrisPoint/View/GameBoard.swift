//
//  GameBoard.swift
//  TetrisPoint
//
//  Created by Taof on 6/18/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class GameBoard: UIView {

    // Khai báo game board có 22 hàng, 10 cột (kích thước lý tưởng)
    static let rows = 22
    static let cols = 10
    
    // khai báo margin
    static let margin = 1
    
    // tính chiều rộng thiết bị
    static let screenW: CGFloat = UIScreen.main.bounds.size.width
    
    // Kích thước 1 ô
    static let brickSize = Int(GameBoard.screenW/15)
    static let EmptyColor = UIColor.black
    static let strokeColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    
    var board = [[UIColor]]()
    var currentBrick:Brick?
    
    // Khởi tạo UIView
    override init(frame: CGRect ) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.lightGray
        self.clear()
        currentBrick = Brick(.l(UIColor.white))
    }
    
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // vẽ game board
        for r in  0..<GameBoard.rows {
            for c in 0..<GameBoard.cols {
                let color = self.board[r][c]
                self.drawAtRow(r, c, color)
            }
        }
        
        // vẽ viên gạch hiện tại
        guard let currentBrick = self.currentBrick else { return }
        for p in currentBrick.points {
            let r = Int(p.y) + currentBrick.ty
            let c = Int(p.x) + currentBrick.tx
            // (r >= 0) điều kiện cho phép để vẽ gạch
            if r >= 0 {
                self.drawAtRow(r, c, currentBrick.color)
            }
        }
    }
    
    func drawAtRow(_ row: Int,_ col: Int,_ color: UIColor) {
        let context = UIGraphicsGetCurrentContext()
        let block = CGRect(x: CGFloat((col + 1) * GameBoard.margin + col * GameBoard.brickSize),
                           y: CGFloat((row + 1) * GameBoard.margin + row * GameBoard.brickSize),
                           width: CGFloat(GameBoard.brickSize),
                           height: CGFloat(GameBoard.brickSize))
        
        if color == GameBoard.EmptyColor {
            GameBoard.strokeColor.set()
            context?.fill(block)
        } else {
            color.set()
            UIBezierPath(roundedRect: block, cornerRadius: 1).fill()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func clear() {
        self.currentBrick = nil
        
        self.board = [[UIColor]]()
        for _ in 0..<GameBoard.rows {
            self.board.append(self.generateRow())
        }
        self.setNeedsDisplay()
    }
    
    fileprivate func generateRow() -> [UIColor]! {
        var row = [UIColor]()
        for _ in 0..<GameBoard.cols {
            row.append(GameBoard.EmptyColor)
        }
        return row
    }
    
}
