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
        label.font = UIFont(name: "SF-Pro-Display-Bold", size: 40)
        label.font = UIFont.systemFont(ofSize: 36)
//        label.backgroundColor = UIColor(patternImage: UIImage(named: "Rectangle")!)
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
        label.text = "Free for non-commercial use. \nDon't forget to rebound the shot while using it."
        label.numberOfLines = 2
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
//        label.text("unsplash: @toshidog \n                @leoruvalcabar \n                @kennykiyoshi")
        label.text("""
        unsplash: @toshidog
                          @leoruvalcabar
                          @kennykiyoshi
        """)
        label.numberOfLines = 3
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
        label.font = UIFont.systemFont(ofSize: 12)
        return label
    }()
    var lblv31 : UILabel = {
        let label = UILabel()
        label.text("www.miquido.com")
        label.textColor = UIColor.white
        label.font = UIFont(name: "SF Pro Display", size: 38)
        label.font = UIFont.systemFont(ofSize: 18)
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
        
        view.backgroundColor = #colorLiteral(red: 1, green: 0.2429956496, blue: 0.1381205022, alpha: 1)
        view.sv(
            myView.sv(
                lblv00,
                lblv01
            ),
            myView1.sv(
                lblv10,
                uiImage10,
                lblv11,
                lblv12
            ),
            myView2.sv(
                lblv20,
                uiImage20,
                uiImage21,
                uiImage22,
                lblv21,
                lblv22,
                lblv23
                
            ),
            myView3.sv(
                lblv30,
                uiImage30,
                lblv31
            )
        )
        myView.Top == view.safeAreaLayoutGuide.Top + margin
        myView.Leading == view.safeAreaLayoutGuide.Leading + margin
        myView.Height == 155
        myView.Width == 427
//        myView.backgroundColor = .clear
        lblv00.Leading == myView.Leading + 5
        lblv00.Top == myView.Top + 20
        lblv01.Top == lblv00.Bottom + 10
        lblv01.Leading == myView.Leading + 5
        
//        myView1.backgroundColor = .clear
        myView1.Top == myView.Bottom + margin
//        myView1.Leading == view.safeAreaLayoutGuide.Leading + margin
        myView1.Height == 185
        myView1.Width == 450
        myView1.layout(
            5,
            |-lblv10-|,
            15,
            |-lblv11-|,
            15,
            |-lblv12-|
        )
        uiImage10.Top == lblv11.Top - 6
        uiImage10.Width == 170
        uiImage10.Height == 25
        uiImage10.Left == lblv11.Left - 5
        
        myView2.Height == 130
        myView2.Width == 427
        myView2.layout(
            5,
            |-lblv20-|,
            15,
            |-lblv21-|
        )
        uiImage20.Top == lblv21.Top
        uiImage20.Width == 195
        uiImage20.Height == 25
        uiImage20.Left == lblv21.Left - 5
        uiImage21.CenterY == lblv21.CenterY
        uiImage21.Width == 150
        uiImage21.Height == 25
        uiImage21.Left == lblv21.Left + 80
        uiImage22.Bottom == lblv21.Bottom + 2
        uiImage22.Width == 135
        uiImage22.Height == 25
        uiImage22.Left == lblv21.Left + 80
        
        myView3.Height == 100
        myView3.Width == 427
        myView3.layout(
            |-lblv30-|,
            15,
            |-lblv31-|,
            5
        )
        uiImage30.Top == lblv31.Top - 6
        uiImage30.Width == 170
        uiImage30.Height == 25
        uiImage30.Left == lblv31.Left - 5
        
        view.layout(
            10%,
            |-myView-|,
            |-margin-myView1-|,
            (>=margin),
            |-margin-myView2-|,
            |-margin-myView3-|,
            margin
        )
        
    }

}

