//
//  GameView.swift
//  NewGameTeris
//
//  Created by Ba Thoc on 6/27/19.
//  Copyright © 2019 Ba Thoc. All rights reserved.
//

import UIKit

class GameView: UIView {

    var gameBoard = GameBoard(frame: CGRect.zero)
    var gameScore = GameScore(frame: CGRect.zero)
    var nextBrick = NextBrick(frame: CGRect.zero)
    
    var magin: CGFloat = 8
    var topHeight: CGFloat = 0
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white.withAlphaComponent(0.3)
//        self.backgroundColor = UIColor.red
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupLayout() {
        self.addSubview(gameBoard)
        gameBoard.translatesAutoresizingMaskIntoConstraints = false
        gameBoard.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -magin).isActive = true
        gameBoard.leftAnchor.constraint(equalTo: self.leftAnchor, constant: magin).isActive = true
        gameBoard.widthAnchor.constraint(equalToConstant: CGFloat((GameBoard.brickSize + GameBoard.magin)*GameBoard.cols)).isActive = true
        gameBoard.heightAnchor.constraint(equalToConstant: CGFloat((GameBoard.brickSize + GameBoard.magin)*GameBoard.rows)).isActive = true
        
        self.addSubview(gameScore)
        gameScore.translatesAutoresizingMaskIntoConstraints = false
        gameScore.topAnchor.constraint(equalTo: self.topAnchor, constant: magin).isActive = true
        gameScore.bottomAnchor.constraint(equalTo: gameBoard.topAnchor, constant: -magin).isActive = true
        gameScore.leftAnchor.constraint(equalTo: self.leftAnchor, constant: magin).isActive = true
//        gameScore.widthAnchor.constraint(equalToConstant: self.widthAnchor - magin*2)
        gameScore.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -magin).isActive = true
        
        self.addSubview(nextBrick)
        nextBrick.translatesAutoresizingMaskIntoConstraints = false
        nextBrick.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -magin).isActive = true
        nextBrick.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -magin).isActive = true
        nextBrick.topAnchor.constraint(equalTo: gameScore.bottomAnchor, constant: magin).isActive = true
        nextBrick.leftAnchor.constraint(equalTo: gameBoard.rightAnchor, constant: magin).isActive = true
    }
    
}
