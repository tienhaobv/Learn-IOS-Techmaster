//
//  ViewController.swift
//  TetrisPoint
//
//  Created by Taof on 6/18/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var gameBoard = GameBoard(frame: CGRect.zero)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        gameBoard.frame = CGRect(x: 0, y: 20, width: view.frame.width, height: view.frame.height)
        view.addSubview(gameBoard)
    }


}

