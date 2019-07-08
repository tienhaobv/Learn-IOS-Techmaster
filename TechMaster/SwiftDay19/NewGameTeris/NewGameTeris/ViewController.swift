//
//  ViewController.swift
//  NewGameTeris
//
//  Created by Ba Thoc on 6/27/19.
//  Copyright © 2019 Ba Thoc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var gameview: GameView!
    
    enum GameState:Int {
        case stop = 0
        case play
        case pause
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameview = GameView(frame: CGRect.zero)
        view.addSubview(gameview)
        //gameview = GameView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height))
        gameview.translatesAutoresizingMaskIntoConstraints = false
        gameview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        gameview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        gameview.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        gameview.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
    }
    
    
    
    func createView(){
        
    }


}

