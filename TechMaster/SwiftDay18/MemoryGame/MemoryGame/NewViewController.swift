//
//  NewViewController.swift
//  MemoryGame
//
//  Created by Ba Thoc on 7/4/19.
//  Copyright © 2019 Ba Thoc. All rights reserved.
//

import UIKit

class NewViewController: UIViewController {

    
    @IBOutlet weak var bg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        bg.frame = CGRect(x: 0, y: -3, width: view.frame.width, height: view.frame.height + 5)
        // Do any additional setup after loading the view.
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
