//
//  DonateViewController.swift
//  BTLayoutStevia
//
//  Created by Ba Thoc on 9/9/19.
//  Copyright © 2019 Ba Thoc. All rights reserved.
//

import UIKit
import Stevia

class DonateViewController: UIViewController {

    var myHeader : UIView = UIView()
    var myView1 : UIView = UIView()
    var myView2 : UIView = UIView()
    
    var imgMuiten: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "muiten")
        return img
    }()
    
    var imgDog : UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "imgDog3x")
        return img
    }()
    
    var lblTitle : UILabel = {
        let lable = UILabel()
        lable.font = UIFont.boldSystemFont(ofSize: 38)
        lable.textColor = .black
        lable.text = "Save a life. \nDonate today."
        lable.numberOfLines = 2
        return lable
    }()
    
    var price25 : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.orange
        btn.layer.cornerRadius = 5
        btn.text("$25")
        btn.setTitleColor(UIColor.white, for: .normal)
        return btn
    }()
    
    var price50 : UIButton = {
        let btn = UIButton()
        btn.text("$50")
        btn.backgroundColor = UIColor.orange
        btn.layer.cornerRadius = 5
        btn.setTitleColor(UIColor.white, for: .normal)
        return btn
    }()
    
    var price100 : UIButton = {
        let btn = UIButton()
        btn.text("$100")
        btn.backgroundColor = UIColor.orange
        btn.layer.cornerRadius = 5
        btn.setTitleColor(UIColor.white, for: .normal)
        return btn
    }()
    
    var btnOtherAmount : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.white
        btn.layer.cornerRadius = 5
        btn.layer.borderWidth = 1
        btn.layer.borderColor = UIColor.orange.cgColor
        btn.text("Other amount")
        btn.setTitleColor(UIColor.orange, for: .normal)
        return btn
    }()
    
    var lblMessend : UILabel = {
        let lbl = UILabel()
        let lbl2 = UILabel()
        lbl2.textColor = UIColor.red
        lbl2.text = "$50"
        lbl.text = lbl2.text! + " can feed a large dog \n for a month"
        lbl.numberOfLines = 2
        lbl.textAlignment = .center
        lbl.font = UIFont.systemFont(ofSize: 22)
        return lbl
    }()
    
    var btnDonate : UIButton = {
        let btn = UIButton()
        btn.backgroundColor = UIColor.red
        btn.layer.cornerRadius = 5
        btn.text("Donate $25")
        btn.setTitleColor(UIColor.white, for: .normal)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.sv(
            myHeader.sv(imgMuiten),
            myView1.sv(
                imgDog.sv(lblTitle)
            ),
            myView2.sv(
                price25,
                price50,
                price100,
                btnOtherAmount
            ),
            lblMessend,
            btnDonate
        )
        
//        myHeader.backgroundColor = .blue
//        myView1.backgroundColor = .red
//        myView2.backgroundColor = .purple
        myHeader.Top == view.safeAreaLayoutGuide.Top
        imgMuiten.Bottom == myHeader.Bottom
        imgMuiten.Left == myHeader.Left + 10
        imgMuiten.Width == 20
        imgMuiten.Height == 15
        
        
        view.layout(
            |-myHeader.width(80%).height(80).centerHorizontally()-|,
            20,
            |-myView1.width(80%).height(380).centerHorizontally()-|,
            20,
            |-myView2.width(80%).height(120).centerHorizontally()-|,
            (>=10),
            |-lblMessend.width(80%).height(200).centerHorizontally()-|,
            |-btnDonate.width(80%).height(50).centerHorizontally()-|,
            30
        )
        
        lblTitle.left(10).top(-30)
        imgDog.width(80%).height(90%).centerHorizontally()
        imgDog.Bottom == myView1.Bottom
        
        myView2.layout(
            |-price25.width(30%).height(40)-price50.width(30%).height(40)-price100.width(30%).height(40)-|,
            (>=15),
            |-btnOtherAmount.width(100%).height(40)-|
        )
        
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
