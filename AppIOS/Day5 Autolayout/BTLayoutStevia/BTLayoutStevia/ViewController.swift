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
    var uiImage10 : UIView = UIImageView(image: UIImage(named: "Rectangle"))
    var uiImage20 : UIView = UIImageView(image: UIImage(named: "Rectangle"))
    var uiImage21 : UIView = UIImageView(image: UIImage(named: "Rectangle"))
    var uiImage22 : UIView = UIImageView(image: UIImage(named: "Rectangle"))
    var uiImage30 : UIView = UIImageView(image: UIImage(named: "Rectangle"))
    var lblv00 : UILabel = {
        let label = UILabel()
        label.text("Hi there! 👋")
        label.textColor = UIColor.white
        label.font = UIFont(name: "SF-Pro-Display-Bold", size: 44)
        label.font = UIFont.systemFont(ofSize: 44)
        label.backgroundColor = UIColor(patternImage: UIImage(named: "Rectangle")!)
        return label
    }()
    var lblv01 : UILabel = {
        let label = UILabel()
        label.text("Thanks for downloading!")
        label.textColor = UIColor.white
        label.font = UIFont(name: "SF Pro Display", size: 24)
        label.font = UIFont.systemFont(ofSize: 24)
        return label
    }()
    var lblv10 : UILabel = {
        let label = UILabel()
        label.text("Credits to 🙈")
        label.textColor = UIColor.white
        label.font = UIFont(name: "SF Pro Display", size: 12)
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    var lblv11 : UILabel = {
        let label = UILabel()
        label.text("@dominikakamola")
        label.textColor = UIColor.white
            label.font = UIFont(name: "SF Pro Display", size: 18)
        label.font = UIFont.systemFont(ofSize: 18)
            return label
    }()
    var lblv12 : UILabel = {
        let label = UILabel()
        label.text("Free for non-commercial use. \nDon't forget to rebound the shot while using it.")
        label.textColor = UIColor.white
        label.font = UIFont(name: "SF Pro Display", size: 12)
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    var lblv20 : UILabel = {
        let label = UILabel()
        label.text("Photo credits to 📷 ")
        label.textColor = UIColor.white
        label.font = UIFont(name: "SF Pro Display", size: 12)
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    var lblv21 : UILabel = {
        let label = UILabel()
        label.text("unsplash: @toshidog/n           @leoruvalcabar/n           @kennykiyoshi")
        label.textColor = UIColor.white
        label.font = UIFont(name: "SF Pro Display", size: 38)
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    var lblv22 : UILabel = UILabel()
    var lblv23 : UILabel = UILabel()
    var lblv30 : UILabel = {
        let label = UILabel()
        label.text("With ❤️ from")
        label.textColor = UIColor.white
        label.font = UIFont(name: "SF Pro Display", size: 24)
        return label
    }()
    var lblv31 : UILabel = {
        let label = UILabel()
        label.text("www.miquido.com")
        label.textColor = UIColor.white
        label.font = UIFont(name: "SF Pro Display", size: 38)
        return label
    }()
//    var uiImage10 : UIView =  {
//        let myImageView = UIImageView()
//        myImageView.image = UIImage(named: "Rectangle")
//        return myImageView
//    }()
    
    var margin : CGFloat = 30
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = #colorLiteral(red: 1, green: 0.3254901961, blue: 0.2196078431, alpha: 0.799604024)
        view.sv(
            myView.sv(
                lblv00,
                lblv01
            ),
            myView1.sv(
                lblv10,
                lblv11,
                uiImage10,
                lblv12
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
        myView.Top == view.safeAreaLayoutGuide.Top + margin
        myView.Leading == view.safeAreaLayoutGuide.Leading + margin
        myView.Height == 172
        myView.Width == 427
        myView.backgroundColor = .green
        lblv00.Leading == myView.Leading + 5
        lblv00.Top == myView.Top + 20
        lblv01.Top == lblv00.Bottom + 10
        lblv01.Leading == myView.Leading + 5
        
        myView1.backgroundColor = .blue
        myView1.Top == myView.Bottom + margin
        myView1.Leading == view.safeAreaLayoutGuide.Leading + margin
        myView1.Height == 185
        myView1.Width == 450
        view.layout(
            10%,
            |-myView-|,
            |-myView1-|,
            |-myView2-|,
            |-myView3-|
        )
        
    }

}

