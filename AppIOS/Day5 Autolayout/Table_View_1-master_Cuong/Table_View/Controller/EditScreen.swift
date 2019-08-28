//
//  EditScreen.swift
//  Table_View
//
//  Created by Cuong  Pham on 8/20/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import UIKit
import Stevia

class EditScreen: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    var name: String!
    var image: UIImage!
    var imageName : String!
    var rating : Int!
    var _index : IndexPath!
    
    lazy var nameTextField : UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter your name"
        textField.textAlignment = .center
        textField.font = UIFont.systemFont(ofSize: 18)
        textField.layer.borderWidth = 0.4
        return textField
    }()
    
    lazy var rateLabel : UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.text = "☆☆☆☆☆"
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(onPanRateLabel(sender:)))
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(panGesture)
        return label
    }()
    
    lazy var chooseButton : UIButton = {
        let button = UIButton()
        button.setTitle("Choose photo", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(onTapChooseButton), for: .touchUpInside)
        return button
    }()
    
    lazy var saveButton : UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(onTapSaveButton), for: .touchUpInside)
        return button
    }()
    
    lazy var avatarImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    @objc func onTapChooseButton(){
        print("choose")
        //mo thu vien anh
        let pickerController = UIImagePickerController()
        pickerController.delegate = self
        pickerController.allowsEditing = true
        pickerController.sourceType = .photoLibrary
        self.present(pickerController, animated: true)
    }
    
    @objc func onPanRateLabel(sender : UIPanGestureRecognizer){
        let locationView = sender.location(in: self.view)
        let newRateLabelFrame = self.view.convert(rateLabel.frame, from: rateLabel.superview)
        let fram1 = CGRect(x: newRateLabelFrame.origin.x,
                           y: newRateLabelFrame.origin.y,
                           width: newRateLabelFrame.size.width / 5,
                           height: newRateLabelFrame.size.height)
        let fram2 = CGRect(x: newRateLabelFrame.origin.x,
                           y: newRateLabelFrame.origin.y,
                           width: 2 * newRateLabelFrame.size.width / 5,
                           height: newRateLabelFrame.size.height)
        let fram3 = CGRect(x: newRateLabelFrame.origin.x,
                           y: newRateLabelFrame.origin.y,
                           width: 3 * newRateLabelFrame.size.width / 5,
                           height: newRateLabelFrame.size.height)
        let fram4 = CGRect(x: newRateLabelFrame.origin.x,
                           y: newRateLabelFrame.origin.y,
                           width: 4 * newRateLabelFrame.size.width / 5,
                           height: newRateLabelFrame.size.height)
        let fram5 = newRateLabelFrame
        
        if fram1.contains(locationView) {
            rateLabel.text = "⭐︎☆☆☆☆"
            self.rating = 1
        }else if fram2.contains(locationView) {
            rateLabel.text = "⭐︎⭐︎☆☆☆"
            self.rating = 2
        }else if fram3.contains(locationView) {
            rateLabel.text = "⭐︎⭐︎⭐︎☆☆"
            self.rating = 3
        }else if fram4.contains(locationView) {
            rateLabel.text = "⭐︎⭐︎⭐︎⭐︎☆"
            self.rating = 4
        }else if fram5.contains(locationView) {
            rateLabel.text = "⭐︎⭐︎⭐︎⭐︎⭐︎"
            self.rating = 5
        }
    }

    fileprivate func autoLayout(){
        view.sv(nameTextField, avatarImage ,chooseButton, saveButton, rateLabel)
        nameTextField.centerHorizontally().width(60%).height(35)
        nameTextField.Top == view.safeAreaLayoutGuide.Top + 20
        
        rateLabel.centerHorizontally()
        rateLabel.Top == nameTextField.Bottom + 20
        
        chooseButton.centerHorizontally().width(50%).height(50)
        chooseButton.Top == rateLabel.Bottom + 20
        
        avatarImage.centerHorizontally().size(150)
        avatarImage.Top == chooseButton.Bottom + 20
        
        saveButton.centerHorizontally().width(120).height(50)
        saveButton.Bottom == view.safeAreaLayoutGuide.Bottom - 50
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        autoLayout()
    
        nameTextField.text = name
        if rating == 1 {
            rateLabel.text = "⭐︎☆☆☆☆"
        }else if rating == 2 {
            rateLabel.text = "⭐︎⭐︎☆☆☆"
        }else if rating == 3 {
            rateLabel.text = "⭐︎⭐︎⭐︎☆☆"
        }else if rating == 4 {
            rateLabel.text = "⭐︎⭐︎⭐︎⭐︎☆"
        }else if rating == 5 {
            rateLabel.text = "⭐︎⭐︎⭐︎⭐︎⭐︎"
        }
        if imageName == nil {
            avatarImage.image = image
        }else{
            avatarImage.image = UIImage(named: imageName)
        }
        
        print(_index!)
    }
    
    @objc func onTapSaveButton(){
        MainScreen.data[_index.row].name = nameTextField.text
        MainScreen.data[_index.row].imageName = ""
        MainScreen.data[_index.row].image = avatarImage.image
        MainScreen.data[_index.row].rating = rating
        navigationController?.popViewController(animated: true)
        let mainScreen = self.navigationController?.topViewController as? MainScreen
        mainScreen?.tableView.reloadRows(at: [_index], with: .automatic)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let choosedImage : UIImage = info[UIImagePickerController.InfoKey.editedImage] as! UIImage
        avatarImage.image = choosedImage
        picker.dismiss(animated: true, completion: nil)
    }
}
