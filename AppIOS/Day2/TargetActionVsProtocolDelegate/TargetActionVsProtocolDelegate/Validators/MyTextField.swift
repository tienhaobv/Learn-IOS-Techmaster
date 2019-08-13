//
//  MyTextField.swift
//  TargetActionVsProtocolDelegate
//
//  Created by Techmaster on 8/1/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

//var errorLabel: UILabel!
//var StackView: UIStackView!
//var view: UIViewController!

class MyTextField: UITextField {

    var validatorType: ValidatorType?
    
    func _validateTextField (_errorLabel: UILabel) -> Bool {
        if let myText = self as? MyTextField {
            do {
                let text = try myText.validatedText(validationType: myText.validatorType!)
                print(text)
            } catch (let error){
                let errStr = (error as! ValidationError).message
                //                let lbl : UILabel!
                _errorLabel.text = errStr
                _errorLabel.frame.origin.x = self.superview!.frame.origin.x + self.frame.origin.x
                _errorLabel.frame.origin.y = self.frame.origin.y + self.superview!.frame.origin.y + self.frame.size.height + 7
                self.borderStyle = .line
                self.layer.borderWidth = 1.0
                self.layer.borderColor = UIColor.red.cgColor
                return false
            }
        }
        return true
    }
//    func insetUItextField(_errorLabel: UILabel, _StackView: UIStackView, _view: UIViewController) {
//        errorLabel = _errorLabel
//        StackView = _StackView
//        view = _view
//    }
   
}
//extension MyTextField: UITextFieldDelegate {
//
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        textField.backgroundColor = UIColor.white
//    }
//
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//        if validateTextField(textField: textField) {
//            errorLabel.text = ""
//            return true
//        } else {
//            return false
//        }
//    }
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        textField.backgroundColor = UIColor(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 1.0)
//    }
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        if validateTextField(textField: textField) {
//            errorLabel.text = ""
//            if let nextField = view.viewWithTag(textField.tag + 1) as? UITextField {
//                nextField.becomeFirstResponder()
//            } else {
//                textField.resignFirstResponder()
//            }
//            return true
//        } else {
//            return false
//        }
//    }
//
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        currentlyFocusedTextField = textField
//        return true
//    }
//
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
//}
