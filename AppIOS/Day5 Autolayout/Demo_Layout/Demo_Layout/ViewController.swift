//
//  ViewController.swift
//  Demo_Layout
//
//  Created by Ba Thoc on 8/12/19.
//  Copyright © 2019 Ba Thoc. All rights reserved.
//

import UIKit
import Stevia

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        bai3()
    }
    
    func bai1() {
        let myView = UIView(frame: CGRect.zero)
        let myView1 = UIView(frame: CGRect.zero)
        let myView2 = UIView(frame: CGRect.zero)
        let myView3 = UIView(frame: CGRect.zero)
        let margin : CGFloat = 20
        let heightView : CGFloat = 100
        let n = view.frame.width - heightView*3 - margin*2
        
        view.backgroundColor = UIColor.white
        view.sv(
            myView,
            myView1,
            myView2,
            myView3
        )
        
        //        myView.safeAreaLayoutGuide.Top + margin
        //        myView1.safeAreaLayoutGuide.Top + margin
        //        myView2.safeAreaLayoutGuide.Top + margin
        
        view.layout(
            50,
            |-margin-myView.size(heightView)-n/2-myView1.size(heightView)-n/2-myView2.size(heightView)-margin-|,
            //            |-margin-myView.size(100)-(>=margin)-myView2.size(100)-margin-|,
            //            |-myView-myView1.size(100)-myView2-|,
            margin,
            |-margin-myView3-margin-| ~ heightView
        )
        
        
        myView.backgroundColor = UIColor.orange
        myView1.backgroundColor = UIColor.green
        myView2.backgroundColor = UIColor.red
        myView3.backgroundColor = UIColor.blue
        view.addSubview(myView)
        //        relayout()
    }
    
    func bai2() {
        let myView = UIView(frame: CGRect.zero)
        let myView1 = UIView(frame: CGRect.zero)
        let myView2 = UIView(frame: CGRect.zero)
        let myView3 = UIView(frame: CGRect.zero)
        let circle = UIView(frame: CGRect.zero)
        let margin : CGFloat = 20
        
        view.backgroundColor = UIColor.white
        view.sv(
            myView,
            myView1,
            myView2,
            myView3,
            circle
        )
        
        myView.Top == view.safeAreaLayoutGuide.Top + margin
        myView1.Top == view.safeAreaLayoutGuide.Top + margin
        myView2.Bottom == view.safeAreaLayoutGuide.Bottom - margin
        myView3.Bottom == view.safeAreaLayoutGuide.Bottom - margin
//        myView.safeAreaLayoutGuide.Top + margin
//        myView1.safeAreaLayoutGuide.Top + margin
//        myView2.safeAreaLayoutGuide.Bottom - margin
//        myView3.safeAreaLayoutGuide.Bottom - margin
        circle.centerVertically().centerHorizontally().size(80)
        
        view.layout(
            |-margin-myView.size(50)-(>=20)-myView1.size(50)-margin-|,
            |-margin-myView2.size(50)-(>=20)-myView3.size(50)-margin-|
        )
        
        myView.backgroundColor = UIColor.orange
        myView1.backgroundColor = UIColor.orange
        myView2.backgroundColor = UIColor.orange
        myView3.backgroundColor = UIColor.orange
        circle.backgroundColor = UIColor.gray
        circle.layer.cornerRadius = 40
        
    }
    
    func bai3(){
        let myView = UIView(frame: CGRect.zero)
        let myView1 = UIView(frame: CGRect.zero)
        let myView2 = UIView(frame: CGRect.zero)
        let myView3 = UIView(frame: CGRect.zero)
        let myView4 = UIView(frame: CGRect.zero)
        let margin : CGFloat = 20
        let heightView : CGFloat = 100
        let n = view.frame.height - heightView*5 - margin*4
        
        view.sv(
            myView,
            myView1,
            myView2,
            myView3,
            myView4
        )
        
        myView.Top == view.safeAreaLayoutGuide.Top + margin
        myView.Leading == view.safeAreaLayoutGuide.Leading + margin
        myView4.Bottom == view.safeAreaLayoutGuide.Bottom - margin
        myView4.Leading == view.safeAreaLayoutGuide.Leading + margin
        myView2.Trailing == view.safeAreaLayoutGuide.Trailing - margin
        myView1.Top == myView.Bottom + n/4
        myView3.Bottom == myView4.Top - n/4
        
        view.layout(
            myView.size(heightView),
            (>=margin),
            myView4.size(heightView)
        )
        view.layout(
            myView1.size(heightView).centerHorizontally(),
            (>=margin),
            myView3.size(heightView).centerHorizontally()
        )
        
        myView2.centerVertically().size(heightView)
        
        myView.backgroundColor = UIColor.orange
        myView1.backgroundColor = UIColor.orange
        myView2.backgroundColor = UIColor.orange
        myView3.backgroundColor = UIColor.orange
        myView4.backgroundColor = UIColor.orange
        
    }
    
    func relayout() {
//        let screen_size = view.bounds.size
//        let min_size = CGFloat.minimum(screen_size.width, screen_size.height)
//        myView.frame = CGRect(x: 0, y: 0, width: min_size * 0.3333, height: min_size * 0.3333)
//        myView.center = CGPoint(x: screen_size.width * 0.5, y: screen_size.height * 0.5)
    }
    
    override func viewDidLayoutSubviews() {
//        relayout()
    }
    
    override func viewWillLayoutSubviews() {
//        relayout()
    }

}

