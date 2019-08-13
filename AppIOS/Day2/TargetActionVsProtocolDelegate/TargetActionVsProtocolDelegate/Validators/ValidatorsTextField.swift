//
//  ValidatorsTextField.swift
//  TargetActionVsProtocolDelegate
//
//  Created by Ba Thoc on 8/5/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class ValidatorsTextField: UITextField, UITextFieldDelegate {

    var validatorType: ValidatorType?
    var errorLable = UILabel(frame: CGRect.zero)
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // scrollview tự sử lý event bên trong nó
        self.delegate = self
        self.backgroundColor = UIColor.lightGray
        errorLable.textColor = .red
    }
    
    func hideErrorLable() {
        errorLable.isHidden = true
    }
    
    func showErrorLable(mes: String, frame: CGRect) {
        errorLable.isHidden = false
        errorLable.frame = frame
    }
    
    //
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = UIColor.white
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.backgroundColor = UIColor(displayP3Red: 0.9, green: 0.9, blue: 0.9, alpha: 0.9)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = self.superview!.viewWithTag(textField.tag + 1) as? UITextField {
            nextField.becomeFirstResponder()
        } else {
            textField.resignFirstResponder()
        }
        return true
    }
    func validateTextField() -> Bool {
            do {
                let text = try self.validatedText(validationType: self.validatorType!)
                print(text)
            } catch (let error){
                let errStr = (error as! ValidationError).message
                
                let textFielFrame = self.superview!.convert(self.frame, to: self.findAnsetorView()!)
                let errorlableFrame = CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
                errorLable.text = errStr
                errorLable.frame.origin.x = self.superview!.frame.origin.x + self.frame.origin.x
                errorLable.frame.origin.y = self.frame.origin.y + self.superview!.frame.origin.y + self.frame.size.height + 7
//                self.borderStyle = .line
//                self.layer.borderWidth = 1.0
//                self.layer.borderColor = UIColor.red.cgColor
                return false
            }
        return true
        }

}
