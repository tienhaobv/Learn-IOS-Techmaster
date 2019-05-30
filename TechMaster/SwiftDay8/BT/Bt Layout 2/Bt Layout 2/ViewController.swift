//
//  ViewController.swift
//  Bt Layout 2
//
//  Created by Ngô Hào on 5/16/19.
//  Copyright © 2019 Ngô Hào. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var Circle: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    override func viewWillLayoutSubviews() {
        Circle.clipsToBounds = true
        Circle.layer.cornerRadius = Circle.bounds.size.height/2
    }


}

