//
//  DoneViewController.swift
//  NaviVSTableView
//
//  Created by Ba Thoc on 8/22/19.
//  Copyright © 2019 Ba Thoc. All rights reserved.
//

import UIKit

class DoneViewController: UIViewController {

    let dismiss = UIButton()
    let backRoot = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .purple
        dismiss.frame = CGRect(x: 100, y: 200, width: 100, height: 50)
        view.addSubview(dismiss)
        dismiss.backgroundColor = .green
        dismiss.setTitle("Dismiss", for: .normal)
        dismiss.addTarget(self, action: #selector(dismissFunction), for: .touchUpInside)
        
        
        backRoot.frame = CGRect(x: view.frame.width/2, y: 200, width: 100, height: 50)
        view.addSubview(backRoot)
        backRoot.backgroundColor = .red
        backRoot.setTitle("Back", for: .normal)
        backRoot.addTarget(self, action: #selector(backRootBT), for: .touchUpInside)
    }
    

    @objc func dismissFunction() {
        dismiss(animated: true, completion: nil)
    }
    
    
    @objc func backRootBT() {
        //back về màn trước đó
//        navigationController?.popViewController(animated: true)
        
        // từ đâu cũng back về màn đầu
//        navigationController?.popToRootViewController(animated: true)
        
        // back về màn bất kỳ trước nó
        // C1
//        if let secondVC = navigationController?.viewControllers[1] as? SecondViewController{
//            navigationController?.popToViewController(secondVC, animated: true)
//        }
//        
        
        // C2
        for vc in navigationController!.viewControllers{
            if let secondVC = vc as? SecondViewController{
                navigationController?.popToViewController(secondVC, animated: true)
            }
        }
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
