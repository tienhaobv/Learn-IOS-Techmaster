//
//  ViewController.swift
//  InputIntPrintTotal
//
//  Created by apple on 6/6/19.
//  Copyright © 2019 apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var _import = Int(readLine()!)!
    var total : Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Nhập vào số nguyên dương: ")
        _import = Int(readLine()!)!
        if _import >= 0{
            for i in 0..._import{
                total += i
            }
            print(total)
        }
        else{
            print("Sô âm ")
        }
        // Do any additional setup after loading the view.
    }


}

