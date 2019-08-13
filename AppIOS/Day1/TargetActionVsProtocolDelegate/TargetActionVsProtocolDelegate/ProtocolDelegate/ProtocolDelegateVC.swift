//
//  ProtocolDelegateVC.swift
//  TargetActionVsProtocolDelegate
//
//  Created by Techmaster on 7/28/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class ProtocolDelegateVC: UIViewController {

    @IBOutlet weak var textField: UITextField!
 

    @IBOutlet weak var myScrollView: MyScrollView!
    static var isZoom: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()

//        textField.delegate = self
        textField.backgroundColor = UIColor(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        
        myScrollView.photo = UIImage(named: "normal")
       
        
    }

}

//extension ProtocolDelegateVC : UIScrollViewDelegate {
//    func scrollViewDidZoom(_ scrollView: UIScrollView) {
//        print("scrollViewDidZoom")
//        //textField.backgroundColor = UIColor(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
//    }
//
//}

extension ProtocolDelegateVC : UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("ShouldBeginEditing")
        textField.backgroundColor = UIColor.white
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("Begin Editing")
    }
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("User wants to clear")
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("UtextFieldShouldEndEditing")
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField){
        print("textFieldDidEndEditing")
    }
    
    func textField(_ textField: UITextField) -> Bool{
        print("textField")
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        print("textFieldShouldReturn")
        return true
    }
    
}
