//
//  ViewController.swift
//  YouAreLucky
//
//  Created by Ngô Hào on 5/16/19.
//  Copyright © 2019 Ngô Hào. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var btnPlay: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    var bulbState: Bool = true
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func onPlay(_ sender: UIButton) {
        bulbState = !bulbState
        onBulbState(bulbState: bulbState)
    }
    
    //Code này dễ bảo trì hơn vì phần thay đổi thuộc tính các thành phần giao diện được gom lại vào hàm tái sử dung
    func onBulbState(bulbState: Bool) {
        if bulbState {
            imageView.image = UIImage(named: "Hell")
            btnPlay.setTitle("You are not lucky", for: .normal)
        } else {
            imageView.image = UIImage(named: "Girl")
            btnPlay.setTitle("You are lucky", for: .normal)
        }
    }


}

