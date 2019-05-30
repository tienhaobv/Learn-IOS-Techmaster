//
//  ViewController.swift
//  Bt Layout 4
//
//  Created by Ngô Hào on 5/16/19.
//  Copyright © 2019 Ngô Hào. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var viewBottom: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewTop.backgroundColor = .lightGray
        viewTop.layer.cornerRadius = 10
        viewTop.layer.shadowColor = UIColor.lightGray.cgColor
        viewTop.layer.shadowOpacity = 1
        //viewTop.layer.shadowRadius = 5
        
    }


}

