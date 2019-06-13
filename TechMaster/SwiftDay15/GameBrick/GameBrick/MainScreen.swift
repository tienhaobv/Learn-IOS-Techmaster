//
//  MainScreen.swift
//  GameBrick
//
//  Created by apple on 6/10/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class MainScreen: UIViewController {
    var brickWall: [[Brick]]!
    let margin: CGFloat = 8.0
    let cols: Int = 8
    let rows: Int = 4
    let ball = Ball(R: 13.0)
    let paddle = Paddle()
    var gameTimer: Timer!
    var timer: Timer!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        buildBrickWall()
        initBallAndPaddle()
        if gameTimer == nil {
            gameTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(checkCollection), userInfo: nil, repeats: true)
        }
        
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(gameLoop), userInfo: nil, repeats: true)
    }
    func buildBrickWall() {
        let brick_width = (view.bounds.width - CGFloat(cols + 1) * margin) / CGFloat(cols)
        let brick_height: CGFloat = 20.0
        brickWall = Array(repeating: Array(repeating: Brick(), count: cols), count: rows)
        for i in 0..<rows {
            var brickRows = [Brick]()
            for j in 0..<cols {
                let brick = Brick()
                brick.frame = CGRect(x: margin * CGFloat(j+1) + CGFloat(j) * brick_width,
                                     y: margin * CGFloat(i) + 40.0 + CGFloat(i) * brick_height,
                                     width: brick_width,
                                     height: brick_height)
                brick.backgroundColor = UIColor.brown
                view.addSubview(brick)
                brickRows.append(brick)
            }
            brickWall.append(brickRows)
        }
    }
    
    func initBallAndPaddle() {
        view.addSubview(ball)
        let ycenterPaddle = view.bounds.height - 15.0
        paddle.center = CGPoint(x: view.bounds.width * 0.5, y: ycenterPaddle)
        ball.center = CGPoint(x: view.bounds.width * 0.5, y: ycenterPaddle - paddle.bounds.height * 0.5 - ball.radius)
//                ball.center = CGPoint(x: 100, y: 200)
        view.addSubview(paddle)
        ball.vx = 10
        ball.vy = -12
    }
    @objc func checkCollection() {
//        for brickAr in brickWall {
//            for brick in brickAr {
//                if brick.frame.intersects(ball.frame) {
//                    brick.removeFromSuperview()
//                }
//            }
//        }
    }
    @objc func gameLoop() {
        var ball_new_x = ball.center.x + ball.vx
        var ball_new_y = ball.center.y + ball.vy
//        var bvy : CGFloat = 0.0
        // va vào thành dọc bên phải
        if ball_new_x > view.bounds.width - ball.radius {
            ball.vx = -ball.vx
            ball_new_x = view.bounds.width - ball.radius
        }
        // va thành dọc bên trái
        if ball_new_x < ball.radius {
            ball.vx = -ball.vx
            ball_new_x = ball.radius
        }
        
        // va vào paddle
        if ball_new_y > paddle.frame.origin.y - ball.radius {
            ball.vy = -ball.vy
            ball_new_y = paddle.frame.origin.y - ball.radius
        }
        
        //va vào đỉnh màn hình
        if ball_new_y < ball.radius {
            ball.vy = -ball.vy
            ball_new_y = ball.radius
        }
        var i : Int = 0
        for brickAr in brickWall {
            var j = 0
            for brick in brickAr {
                if brick.frame.intersects(ball.frame) {
                    ball.vy = -ball.vy
//                    bvy = ball.vy
//                    ball.vx = -ball.vx
                    ball_new_y = brick.frame.origin.y + ball.radius + brick.bounds.width/2
                    brick.removeFromSuperview()
                    brickWall[i].remove(at: j)
                    break
                }
                j += 1
            }
            i += 1
        }
        ball.center = CGPoint(x: ball_new_x, y: ball_new_y)
        
    }
}
