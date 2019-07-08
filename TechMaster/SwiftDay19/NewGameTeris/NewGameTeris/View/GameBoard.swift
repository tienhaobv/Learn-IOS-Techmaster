//
//  GameBoard.swift
//  NewGameTeris
//
//  Created by Ba Thoc on 6/27/19.
//  Copyright © 2019 Ba Thoc. All rights reserved.
//

import UIKit

class GameBoard: UIView {
    
    static let rows = 22
    static let cols = 10
    
    static let magin = 1
    
    static let screenW: CGFloat = UIScreen.main.bounds.size.width
    
    static let brickSize = Int(GameBoard.screenW/15)
    static let smallBrickSize = Int(GameBoard.screenW/20)
    static let emptyColor = UIColor.black
    static let strokeColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    
    var img = UIView()
    var gameOver : Bool = false
    var board = [[UIColor]]()
    var timer = Timer()
    var timer2 = Timer()
    var currentBrick:Brick?
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .gray
        self.clear()
        self.addSubview(img)
        img = UIImageView(image: UIImage(named: "youwin-1"))
        img.frame.size = CGSize(width: 500, height: 555)
        img.center = self.center
//        img = PopUPWin(frame: CGRect(x: 0, y: 0, width: self.frame.width - 10, height: self.frame.width/4.38))
        currentBrick = Brick(.t(UIColor(red:1.00, green:0.00, blue:1.00, alpha:1.0)))
        gameInteraction()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(autoMoveDown), userInfo: nil, repeats: true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        
        guard let currentBrick = self.currentBrick else {return}
        for i in currentBrick.points {
            let row = Int(i.y) + currentBrick.ty
            let col = Int(i.x) + currentBrick.tx
            
            if row >= 0 {
                self.drawAtRow(row, col, currentBrick.color)
            }
        }
    }
    
    func drawAtRow(_ row: Int,_ col: Int,_ color: UIColor) {
        let context = UIGraphicsGetCurrentContext()
        let block = CGRect(x: CGFloat((col + 1) * GameBoard.magin + col * GameBoard.brickSize),
                           y: CGFloat((row + 1) * GameBoard.magin + row * GameBoard.brickSize),
                           width: CGFloat(GameBoard.brickSize),
                           height: CGFloat(GameBoard.brickSize))
        
        if color == GameBoard.emptyColor {
            GameBoard.strokeColor.set()
            context?.fill(block)
        } else {
            color.set()
            UIBezierPath(roundedRect: block, cornerRadius: 1).fill()
        }
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
            row.append(GameBoard.emptyColor)
        }
        return row
    }
    
    func gameInteraction() {
        if !gameOver {
            let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
            swipeUp.direction = .up
            self.addGestureRecognizer(swipeUp)
            
            let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
            swipeRight.direction = .right
            self.addGestureRecognizer(swipeRight)
            
            let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
            swipeLeft.direction = .left
            self.addGestureRecognizer(swipeLeft)
            
            let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
            swipeDown.direction = .down
            self.addGestureRecognizer(swipeDown)
        }
    }
    
    @objc func swiped(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction {
            case .up:
                print("up")
                rotateBrick()
            case .left:
                print("left")
                updateX(-1)
            case .right:
                print("right")
                updateX(1)
            case .down:
                print("down")
                dropBrick()
            default:
                break
            }
        }
    }
    
    func rotateBrick() {
        guard let currentBrick = self.currentBrick else { return }
        
        let rotatedPoints = currentBrick.rotatedPoints()
        if self.canRotate(currentBrick, rotatedPoints: rotatedPoints) {
            currentBrick.points = rotatedPoints
            self.setNeedsDisplay()
        }
    }
    
    func canRotate(_ brick:Brick, rotatedPoints:[CGPoint]) -> Bool {
        
        for p in rotatedPoints {
            let r = Int(p.y) + brick.ty
            let c = Int(p.x) + brick.tx
            if r < 0 || r >= GameBoard.rows {
                return false
            }
            if c < 0 || c >= GameBoard.cols {
                return false
            }
            if self.board[r][c] != GameBoard.emptyColor {
                return false
            }
        }
        return true
    }
    
    func updateX(_ x:Int) {
        
        guard let currentBrick = self.currentBrick else { return }
        
        if x > 0 {
            var canMoveRight = Int(currentBrick.right().x) + currentBrick.tx + 1 <= GameBoard.cols-1
            if canMoveRight {
                for p in currentBrick.points {
                    let r = Int(p.y) + currentBrick.ty
                    let c = Int(p.x) + currentBrick.tx + 1
                    
                    // not visible brick point
                    if r < 0 {
                        continue
                    }
                    if self.board[r][c] !=  GameBoard.emptyColor {
                        canMoveRight = false
                        break
                    }
                }
            }
            if canMoveRight {
                currentBrick.moveRight()
                self.setNeedsDisplay()
            }
        } else if x < 0 {
            var canMoveLeft = Int(currentBrick.left().x) + currentBrick.tx - 1 >= 0
            if canMoveLeft {
                for p in currentBrick.points {
                    let r = Int(p.y) + currentBrick.ty
                    let c = Int(p.x) + currentBrick.tx - 1
                    
                    // not visible brick point
                    if r < 0 {
                        continue
                    }
                    if self.board[r][c] !=  GameBoard.emptyColor {
                        canMoveLeft = false
                        break
                    }
                }
            }
            if canMoveLeft {
                currentBrick.moveLeft()
                self.setNeedsDisplay()
            }
        }
    }
    
    func canMoveDown(_ brick:Brick) -> Bool {
        for p in brick.points {
            let r = Int(p.y) + brick.ty + 1
            
            // not visible brick points
            if r < 0 {
                continue
            }
            // reach to bottom
            if r >= GameBoard.rows {
                return false
            }
            let c = Int(p.x) + brick.tx
            if self.board[r][c] !=  GameBoard.emptyColor {
                return false
            }
        }
        return true
    }
    
    func dropBrick() {
        timer2 = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(autoMoveDown), userInfo: nil, repeats: true)
        autoMoveDown()
    }
    
    @objc func autoMoveDown(){
        guard let currentBrick = self.currentBrick else { return }
        var canMoveDown = Int(currentBrick.bottom().y) + currentBrick.ty + 1 <= GameBoard.rows
        if canMoveDown {
            for p in currentBrick.points {
                let r = Int(p.y) + currentBrick.ty + 1
                let c = Int(p.x) + currentBrick.tx
                // not visible brick point
                if r < 0 {
                    continue
                }
                if r >= GameBoard.rows {
                    timer.invalidate()
                    timer2.invalidate()
                    canMoveDown = false
                    update()
                    break
                }else if self.board[r][c] !=  GameBoard.emptyColor {
                    timer.invalidate()
                    timer2.invalidate()
                    canMoveDown = false
                    update()
                    break
                }
            }
        }
        if canMoveDown {
            currentBrick.moveDown()
            self.setNeedsDisplay()
        }
    }
    
    func generateBrick() {
        self.currentBrick = Brick.generate()
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(autoMoveDown), userInfo: nil, repeats: true)
        
    }
    
    func update() -> (isGameOver:Bool, droppedBrick:Bool) {
        
        guard let currentBrick = self.currentBrick else { return (false, false)  }
        
        var droppedBrick = false
        
        if self.canMoveDown(currentBrick) {
            currentBrick.moveDown()
        } else {
            
            droppedBrick = true
            
            for p in currentBrick.points {
                let r = Int(p.y) + currentBrick.ty
                let c = Int(p.x) + currentBrick.tx
                
                // check game over
                // can't move down and brick is out of top bound.
                if r <= 0 {
                    self.setNeedsDisplay()
                    gameOver = true
                    print("GameOver")
                    return (true, false)
                }
                self.board[r][c] = currentBrick.color
            }
            // clear lines
            self.lineClear()
            
            self.generateBrick()
        }
        self.setNeedsDisplay()
        
        return (false, droppedBrick)
    }
    
    func lineClear() {
        var lineCount = 0
        var linesToRemove = [Int]()
        
        for i in 0..<self.board.count {
            let row = self.board[i]
            let rows = row.filter { c -> Bool in
                return c != GameBoard.emptyColor
            }
            if rows.count == GameBoard.cols {
                linesToRemove.append(i)
                lineCount += 1
            }
        }
        for line in linesToRemove {
            self.board.remove(at: line)
            self.board.insert(self.generateRow(), at: 0)
        }
        
    }
    
}
