//
//  SecondViewController.swift
//  NaviVSTableView
//
//  Created by Ba Thoc on 8/22/19.
//  Copyright © 2019 Ba Thoc. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    let presenButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(nextFunction))
        
        presenButton.frame = CGRect(x: view.frame.width/2, y: 200, width: 50, height: 20)
        view.addSubview(presenButton)
        presenButton.backgroundColor = .red
        presenButton.setTitle("Button", for: .normal)
        presenButton.addTarget(self, action: #selector(presenBT), for: .touchUpInside)
        
    }
    
    
    @objc func nextFunction() {
        
        print("next")
        let doneVC = DoneViewController()
        // khi title dài quá nút sẽ tự chuyển về "back"
        doneVC.title = "Done VC"
        // back về dúng self vì nó là nút về chính trang này
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        navigationController?.pushViewController(doneVC, animated: true)
    }
    
    @objc func presenBT() {
        print("presen")
        let doneVC = DoneViewController()
        doneVC.title = "Done VC"
        present(doneVC, animated: true, completion: nil)
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
