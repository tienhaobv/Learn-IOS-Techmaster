//
//  ViewController.swift
//  GameTetris
//
//  Created by Tào Quỳnh on 6/13/19.
//  Copyright © 2019 Tào Quỳnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var containerView = UIView()
    var width: CGFloat = 0
    var squareWidth: CGFloat = 0
    var groupBlock = Set<SquareView>()
    override func viewDidLoad() {
        super.viewDidLoad()
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(onSwipe(sender:)))
        swipeUp.direction = .up
        
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(onSwipe(sender:)))
        swipeDown.direction = .down
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(onSwipe(sender:)))
        swipeLeft.direction = .left
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(onSwipe(sender:)))
        swipeRight.direction = .right
        
        
        view.addGestureRecognizer(swipeUp)
        view.addGestureRecognizer(swipeDown)
        view.addGestureRecognizer(swipeLeft)
        view.addGestureRecognizer(swipeRight)
        
        width = self.view.frame.width/2
        containerView.frame = CGRect(x: 0, y: 0, width: width, height: width)
        containerView.center = view.center
        containerView.backgroundColor = UIColor.groupTableViewBackground
        view.addSubview(containerView)
        
        squareWidth = (containerView.bounds.size.width) / 6
        drawI(point: squareWidth)
    }
    @objc func onSwipe(sender: UIGestureRecognizer) {
        if let swipe = sender as? UISwipeGestureRecognizer {
            print(swipe.numberOfTouches)
            switch swipe.direction {
            case .up:
                move(point: squareWidth)
            case .down:
                move(point: squareWidth)
            case .left:
                move(point: squareWidth + 10.0)
            case .right:
                move(point: squareWidth - 10.0)
            default:
                move(point: squareWidth)
            }
            
        }
        
    }
    func move(point: CGFloat) {
        for i in groupBlock {
            i.frame.origin.x += point
        }
    }
    func drawI(point: CGFloat){
        for i in 0...2{
            if i == 1 {
                for j in 0...2 {
                    drawSquare(col: i, row: j, radius: point)
                }
            }
        }
    }
    
    func drawSquare(col: Int, row: Int, radius: CGFloat) {
        let block = SquareView(center: CGPoint(x: radius * CGFloat(col + 1), y: radius * 2 * CGFloat(row)), radius: radius, fillColor: UIColor.orange)
        groupBlock.insert(block)
        containerView.addSubview(block)
    }
}

