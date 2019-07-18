//
//  NewViewController.swift
//  MemoryGame
//
//  Created by Ba Thoc on 7/4/19.
//  Copyright © 2019 Ba Thoc. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    
    @IBOutlet weak var lble: UILabel!
    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var bg: UIImageView!
    @IBOutlet weak var btnEasy: UIButton!
    @IBOutlet weak var btnHard: UIButton!
    var timer = Timer()
//    var choose = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        bg.frame = CGRect(x: 0, y: -3, width: view.frame.width, height: view.frame.height + 5)
        let tap = UITapGestureRecognizer(target: self, action: #selector(tab))
//        btnPlay.layer.cornerRadius = 150
        btnPlay.addGestureRecognizer(tap)
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(easyLoop), userInfo: nil, repeats: true)
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(tab2))
        //        btnPlay.layer.cornerRadius = 150
        btnHard.addGestureRecognizer(tap2)
        let tap3 = UITapGestureRecognizer(target: self, action: #selector(tab3))
        //        btnPlay.layer.cornerRadius = 150
        btnEasy.addGestureRecognizer(tap3)
    }
    @objc func tab() {
        ViewController.playSound(name: "touch", type: "wav")
//        choose = 2
        ViewController.col = 3
        ViewController.row = 4
        self.performSegue(withIdentifier: "goScene2", sender: self)
    }
    
    @objc func tab2() {
        ViewController.playSound(name: "touch", type: "wav")
//        choose = 3
        
        ViewController.col = 4
        ViewController.row = 5
        self.performSegue(withIdentifier: "goScene2", sender: self)
    }
    
    @objc func tab3() {
        ViewController.playSound(name: "touch", type: "wav")
//        choose = 1
        ViewController.col = 2
        ViewController.row = 3
        self.performSegue(withIdentifier: "goScene2", sender: self)
    }
    // chuyền dữ liệu số hàng và cột qua scene bên
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let des = segue.destination as! ViewController
//        if choose == 1 {
//            des.row = 3
//            des.col = 2
//        }
//        else if choose == 2 {
//            des.row = 4
//            des.col = 3
//        }
//        else if choose == 3 {
//            des.row = 5
//            des.col = 4
//        }
//        else {
//            print("destination erro")
//        }
    }
    
    var check : Bool = true
    var e : CGFloat = 1
    var m : CGFloat = 2
    var h : CGFloat = 3
    @objc func easyLoop() {
        e+=0.1
        m+=0.1
        h+=0.1
        btnEasy.frame.origin.y = btnEasy.frame.origin.y + cos(e)
        btnHard.frame.origin.y = btnHard.frame.origin.y + cos(h)
        btnPlay.frame.origin.y = btnPlay.frame.origin.y + cos(m)
//        lble.text = String(Int(x)) + String(check)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
