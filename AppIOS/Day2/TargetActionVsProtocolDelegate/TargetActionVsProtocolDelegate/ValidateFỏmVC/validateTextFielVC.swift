//
//  validateTextFielVC.swift
//  TargetActionVsProtocolDelegate
//
//  Created by Ba Thoc on 8/5/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class validateTextFielVC: UIViewController {

    @IBOutlet weak var txtf1: ValidatorsTextField!
    @IBOutlet weak var txtf4: ValidatorsTextField!
    @IBOutlet weak var txtf3: ValidatorsTextField!
    @IBOutlet weak var txtf2: ValidatorsTextField!
    @IBOutlet weak var txtf5: ValidatorsTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        txtf1.tag = 100
        txtf2.tag = 101
        txtf3.tag = 102
        txtf4.tag = 103
        txtf5.tag = 104
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
