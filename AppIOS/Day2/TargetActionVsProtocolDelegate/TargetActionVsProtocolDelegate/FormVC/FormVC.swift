//
//  FormVC.swift
//  TargetActionVsProtocolDelegate
//
//  Created by Techmaster on 7/29/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class FormVC: UIViewController {

    @IBOutlet weak var text1: MyTextField!
    @IBOutlet weak var text2: MyTextField!
    @IBOutlet weak var text3: MyTextField!
    @IBOutlet weak var text4: MyTextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var StackView: UIStackView!
    weak var currentlyFocusedTextField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        text1.backgroundColor = UIColor(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        text2.backgroundColor = UIColor(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        text3.backgroundColor = UIColor(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        text4.backgroundColor = UIColor(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
        text1.delegate = self
        text2.delegate = self
        text3.delegate = self
        text4.delegate = self

        text1.validatorType = ValidatorType.email
        text1.tag = 100
        text2.tag = 101
        text3.tag = 102
        text4.tag = 103
        errorLabel.text = ""
        text4.rightViewMode = .always
        text4.rightView = UIImageView(image: UIImage(named: "dolar"))
    }
    
    
}

extension FormVC: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = UIColor.white
    }

    func textFieldShouldEndEditing(_ textField: MyTextField) -> Bool {
        if textField._validateTextField(_errorLabel: errorLabel) {
            errorLabel.text = ""
            return true
        } else {
            return false
        }
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = UIColor(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
    }

    private func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let newText = textField as? MyTextField {
            if newText._validateTextField(_errorLabel: errorLabel){
            errorLabel.text = ""
            if let nextField = self.view.viewWithTag(textField.tag + 1) as? UITextField {
                nextField.becomeFirstResponder()
            } else {
                textField.resignFirstResponder()
            }
            return true
        } else {
            return false
            }
        }
        return false
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        currentlyFocusedTextField = textField
        return true
    }

//    func validateTextField (textField: UITextField) -> Bool {
//        if let myText = textField as? MyTextField {
//            do {
//                let text = try myText.validatedText(validationType: myText.validatorType!)
//                print(text)
//            } catch (let error){
//                let errStr = (error as! ValidationError).message
////                let lbl : UILabel!
//                errorLabel.text = errStr
//                errorLabel.frame.origin.x = textField.frame.origin.x + 8
//                errorLabel.frame.origin.y = textField.frame.origin.y + StackView.frame.origin.y + textField.frame.size.height + 8
////                errorLabel.frame = CGRect(x: StackView.frame.origin.x + textField.frame.origin.x,
////                                          y: StackView.frame.origin.y + textField.frame.origin.y + textField.frame.size.height + 8, width: textField.frame.size.width, height: 20)
////                lbl.frame.cgr
////                lbl.text = errStr
////                view.addSubview(lbl)
//                textField.borderStyle = .line
//                textField.layer.borderWidth = 1.0
//                textField.layer.borderColor = UIColor.red.cgColor
//                return false
//            }
//        }
//        return true
//    }
}
