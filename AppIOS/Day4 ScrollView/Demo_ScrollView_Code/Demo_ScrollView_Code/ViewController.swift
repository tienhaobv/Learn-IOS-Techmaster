//
//  ViewController.swift
//  Demo_ScrollView_Code
//
//  Created by Cuong  Pham on 8/8/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var scrollView1 : UIScrollView = UIScrollView()
    var scrollView2 : UIScrollView = UIScrollView()
    var imageView : UIImageView = UIImageView()
    
    let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize.height = 1000
        //scrollView.contentSize.width = 1000
//        scrollView.contentOffset = CGPoint(x: 0, y: 200)
        scrollView.backgroundColor = .red
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        autoLayoutScrollView()
        autoLayoutImageView()
        autoLayoutScrollView1()
        autoLayoutScrollView2()
        // Do any additional setup after loading the view.
    }
    
    fileprivate func autoLayoutScrollView(){
        scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }
    
    fileprivate func autoLayoutImageView(){
        scrollView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Sao")
        imageView.contentMode = .scaleAspectFill
        
        imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 70).isActive = true
    }
    
    fileprivate func autoLayoutScrollView1(){
        scrollView.addSubview(scrollView1)
        scrollView1.translatesAutoresizingMaskIntoConstraints = false
        scrollView1.backgroundColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        scrollView1.contentSize.width = 1000
        
        scrollView1.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 140).isActive = true
        scrollView1.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        scrollView1.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        scrollView1.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }

    fileprivate func autoLayoutScrollView2(){
        scrollView.addSubview(scrollView2)
        scrollView2.backgroundColor = .blue
        scrollView2.contentSize.height = 500
        
        scrollView2.translatesAutoresizingMaskIntoConstraints = false
        scrollView2.topAnchor.constraint(equalTo: scrollView1.bottomAnchor, constant: 50).isActive = true
        scrollView2.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        scrollView2.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        scrollView2.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }

}

