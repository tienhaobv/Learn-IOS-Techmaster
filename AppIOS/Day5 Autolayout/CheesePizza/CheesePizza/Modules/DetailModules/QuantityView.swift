//
//  QuantityView.swift
//  CheesePizza
//
//  Created by Tào Quỳnh on 5/21/19.
//  Copyright © 2019 Tào Quỳnh. All rights reserved.
//

import UIKit
import Stevia

class QuantityView: UIView {

    let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "3"
        textField.textAlignment = .center
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        
        return textField
    }()
    
    let demoPickerView = UIPickerView()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        self.sv(
            textField
        )
        
        self.layout(
            0,
            |-0-textField-0-|,
            0
        )
        
        setupPicker()
        setupToolBar()
    }
    
    func setupPicker() {
        demoPickerView.delegate = self
        demoPickerView.dataSource = self
        textField.inputView = demoPickerView
    }
    
    func setupToolBar() {
        let toolBar = UIToolbar()
        textField.inputAccessoryView = toolBar
        toolBar.sizeToFit()
        let cancelButton = UIBarButtonItem(title: "Huỷ", style: .plain, target: self, action: #selector(cancelAction))
        
        toolBar.setItems([cancelButton], animated: false)
    }
    
    @objc func cancelAction() {
        self.endEditing(true)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("")
    }
    
}

extension QuantityView: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
            let label = UILabel()
            label.textAlignment = .center
            label.text = String(row + 1)
            
            return label
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        textField.text = String(row + 1)
    }
}
