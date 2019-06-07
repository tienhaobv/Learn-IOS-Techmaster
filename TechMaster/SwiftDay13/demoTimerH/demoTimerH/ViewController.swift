//
//  ViewController.swift
//  demoTimerH
//
//  Created by Tào Quỳnh on 6/3/19.
//  Copyright © 2019 Tào Quỳnh. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    @IBOutlet weak var lbTimerCount: UILabel!
    @IBOutlet weak var BgrView: UIView!
    var gameTimer : Timer!
    var tong : Int = 30
    var saveTime : Int = 0
    var AvSound : AVAudioPlayer?
    var heightDown : CGFloat = 0.0
    override func viewDidLoad() {
        super.viewDidLoad()
        saveTime = tong
        
        heightDown = BgrView.frame.height/30
        gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(run), userInfo: nil, repeats: true)
    }

    @objc func run(){
        let path = Bundle.main.path(forResource: "SoundSos.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        if tong > 0 {
            tong -= 1
            print(tong)
            lbTimerCount.text = String(tong)
            BgrView.frame = CGRect(x: BgrView.frame.minX, y: BgrView.frame.minY + heightDown, width: BgrView.frame.width, height: BgrView.frame.height)
        }
        else
        {
            gameTimer.invalidate()
        }
        if tong >= saveTime/2
        {
            do {
            AvSound = try AVAudioPlayer(contentsOf: url)
            AvSound?.play()
            }
            catch{
                // don't load file
            }
        }
        
        
    }

}

