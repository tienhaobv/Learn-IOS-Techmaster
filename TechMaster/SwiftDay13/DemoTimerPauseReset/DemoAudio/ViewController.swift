//
//  ViewController.swift
//  DemoAudio
//
//  Created by Tào Quỳnh on 6/3/19.
//  Copyright © 2019 Tào Quỳnh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var isTime : Int = 0
    var gameTimer : Timer!
    var isPlay : Bool = false
    
    @IBOutlet weak var ibTimerCount: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(run), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func run(){
        
            isTime += 1
            print(isTime)
            ibTimerCount.text = String(isTime)
    }
    
    @IBAction func Play(_ sender: Any) {
        if isPlay == false
        {
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(run), userInfo: nil, repeats: true)
            isPlay = true
        }
    }
    @IBAction func Pause(_ sender: Any) {
        if isPlay == true
        {
        gameTimer.invalidate()
            isPlay = false
        }
    }
    @IBAction func Reset(_ sender: Any) {
        isTime = 0
        ibTimerCount.text = String(0)
        gameTimer.invalidate()
    }
}

