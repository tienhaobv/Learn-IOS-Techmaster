//
//  ViewController.swift
//  UiScrollViewCode
//
//  Created by Ba Thoc on 8/8/19.
//  Copyright © 2019 Ba Thoc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let subScrollView1 : UIScrollView = UIScrollView()
    let subScrollView2 : UIScrollView = UIScrollView()
    let scrollView : UIScrollView = {
        let scrollview = UIScrollView()
        scrollview.translatesAutoresizingMaskIntoConstraints = false
        //scroll một chiều
//        scrollview.contentSize.height = 1000
        //scroll 2 chiều
//        scrollview.contentSize = CGSize(width: 1000, height: 1000)
        scrollview.contentSize.height = 1000
        scrollview.backgroundColor = UIColor.lightGray
        // khi muốn người xem xem từ phần nào của ảnh
//        scrollview.contentOffset = CGPoint(x:50, y:200)
        return scrollview
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(scrollView)
        layoutScrollView()
    }
    
    override func viewWillLayoutSubviews() {
        print("viewWillLayoutSubview")
    }
    
    override func viewDidLayoutSubviews() {
        print("viewDidLayoutSubview")
    }
    
    // hàm layout cho scroll view
    func layoutScrollView() {
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        scrollView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        //Add image for scrollview
        let imageView: UIImageView = {
            let imageview = UIImageView()
            imageview.translatesAutoresizingMaskIntoConstraints = false
            imageview.image = UIImage(named: "")
            // set thuộc tính tràn ảnh hoạc vừa ảnh cho nó
            imageview.contentMode = .scaleAspectFit
            imageview.backgroundColor = UIColor.red
            return imageview
        }()
        
        // thêm ảnh đó vào trong scrollview
        scrollView.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20).isActive = true
        imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
//        imageView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 20).isActive = true
//        imageView.rightAnchor.constraint(equalTo: scrollView.rightAnchor, constant: 20).isActive = true
//        imageView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        scrollView.addSubview(subScrollView1)
        subScrollView1.backgroundColor = .blue
        subScrollView1.contentSize.width = 1000
        subScrollView1.translatesAutoresizingMaskIntoConstraints = false
        
        subScrollView1.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        subScrollView1.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        subScrollView1.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        subScrollView1.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        
        scrollView.addSubview(subScrollView2)
        subScrollView2.backgroundColor = .green
        subScrollView2.contentSize.height = 1000
        subScrollView2.translatesAutoresizingMaskIntoConstraints = false
        
        subScrollView2.topAnchor.constraint(equalTo: subScrollView1.bottomAnchor, constant: 20).isActive = true
        subScrollView2.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        subScrollView2.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        subScrollView2.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }


}

