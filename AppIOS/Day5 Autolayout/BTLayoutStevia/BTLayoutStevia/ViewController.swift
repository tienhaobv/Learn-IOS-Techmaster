//
//  ViewController.swift
//  BTLayoutStevia
//
//  Created by Ba Thoc on 8/13/19.
//  Copyright © 2019 Ba Thoc. All rights reserved.
//

import UIKit
import Stevia

class ViewController: UIViewController {

    var myView : UIView = UIView()
    var myView1 : UIView = UIView()
    var myView2 : UIView = UIView()
    var myView3 : UIView = UIView()
    var lblv00 : UILabel = UILabel()
    var lblv01 : UILabel = UILabel()
    var lblv10 : UILabel = UILabel()
    var lblv11 : UILabel = UILabel()
    var lblv12 : UILabel = UILabel()
    var lblv13 : UILabel = UILabel()
    var lblv20 : UILabel = UILabel()
    var lblv21 : UILabel = UILabel()
    var lblv22 : UILabel = UILabel()
    var lblv23 : UILabel = UILabel()
    var lblv30 : UILabel = UILabel()
    var lblv31 : UILabel = UILabel()
    var uiImage10 : UIView = UIImageView(image: UIImage(named: "Rectangle"))
    var uiImage20 : UIView = UIImageView(image: UIImage(named: "Rectangle"))
    var uiImage21 : UIView = UIImageView(image: UIImage(named: "Rectangle"))
    var uiImage22 : UIView = UIImageView(image: UIImage(named: "Rectangle"))
    var uiImage30 : UIView = UIImageView(image: UIImage(named: "Rectangle"))
    
    var margin : CGFloat = 80
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = UIColor.lightGray
        view.sv(
            myView.sv(
                lblv00,
                lblv01
            ),
            myView1.sv(
                lblv10,
                lblv11,
                lblv12,
                uiImage10,
                lblv13
            ),
            myView2.sv(
                lblv20,
                lblv21,
                lblv22,
                lblv23,
                uiImage20,
                uiImage21,
                uiImage22
                
            ),
            myView3.sv(
                lblv30,
                uiImage30,
                lblv31
            )
        )
    }


}

