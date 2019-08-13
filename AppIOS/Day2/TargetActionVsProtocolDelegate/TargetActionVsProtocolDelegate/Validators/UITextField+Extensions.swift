//
//  UITextField+Extension.swift
//  ValidatorsMediumPost
//
//  Created by Arlind on 8/5/18.
//  Copyright © 2018 Arlind Aliu. All rights reserved.
//

import UIKit.UITextField

weak var currentlyFocusedTextField: UITextField?
//var errorLabel: UILabel!
//var StackView: UIStackView!
//var view: UIViewController!



extension UITextField {
//    func insetUItextField(_errorLabel: UILabel, _StackView: UIStackView, _view: UIViewController) {
//        errorLabel = _errorLabel
//        StackView = _StackView
//        view = _view
//    }
    
    func validatedText(validationType: ValidatorType) throws -> String {
        let validator = VaildatorFactory.validatorFor(type: validationType)
        return try validator.validated(self.text!)
    }
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
//            if let nextField = view.view.viewWithTag(textField.tag + 1) as? UITextField {
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
//                //                let lbl : UILabel!
//                errorLabel.text = errStr
//                errorLabel.frame.origin.x = StackView.frame.origin.y + textField.frame.origin.x
//                errorLabel.frame.origin.y = textField.frame.origin.y + StackView.frame.origin.y + textField.frame.size.height + 7
//                //                errorLabel.frame = CGRect(x: StackView.frame.origin.x + textField.frame.origin.x,
//                //                                          y: StackView.frame.origin.y + textField.frame.origin.y + textField.frame.size.height + 8, width: textField.frame.size.width, height: 20)
//                //                lbl.frame.cgr
//                //                lbl.text = errStr
//                //                view.addSubview(lbl)
//                textField.borderStyle = .line
//                textField.layer.borderWidth = 1.0
//                textField.layer.borderColor = UIColor.red.cgColor
//                return false
//            }
//        }
//        return true
//    }
}
