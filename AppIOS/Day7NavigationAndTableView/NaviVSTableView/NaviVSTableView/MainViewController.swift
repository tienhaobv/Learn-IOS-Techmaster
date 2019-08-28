//
//  MainViewController.swift
//  NaviVSTableView
//
//  Created by Ba Thoc on 8/22/19.
//  Copyright © 2019 Ba Thoc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .gray
        
        // dể tên title
        //c1:
        title = "Main Screen"
        //C2:
        navigationItem.title = "Main Screen2"
        // tạo ra nút bên trái
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFunction))
        
        // nút bằng chữ
        let saveButtom = UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(saveFunction))
        let secondButtom = UIBarButtonItem(title: "Second", style: .done, target: self, action: #selector(secondFunction))
        // nút bằng ảnh
        let homeButtom = UIBarButtonItem(image: UIImage(named: "T##String"), style: .done, target: self, action: #selector(homeFunction))
        
        // đổi màu cho nút
        saveButtom.tintColor = UIColor.purple
        
        // add mảng nút vào thanh bar
        navigationItem.rightBarButtonItems = [saveButtom,homeButtom]
        
        navigationItem.rightBarButtonItem = secondButtom
        
    }
    
    @objc func addFunction() {
        print("add")
    }
    
    @objc func saveFunction() {
        print("save")
    }
    
    @objc func homeFunction() {
        print("home")
    }
    
    @objc func secondFunction() {

        print("second")
        let secondVC = SecondViewController()
        // khi title dài quá nút sẽ tự chuyển về "back"
        secondVC.title = "Second VC"
        // back về dúng self vì nó là nút về chính trang này
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        navigationController?.pushViewController(secondVC, animated: true)
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
