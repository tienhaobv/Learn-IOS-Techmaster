//
//  EditScreen.swift
//  login_with_server
//
//  Created by Cuong  Pham on 9/19/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import UIKit
import Stevia
import Alamofire
import SwiftyJSON

class EditScreen: UIViewController {
    
    var currentUser : User!
    var msg : String!
    var _index : Int!
    
    lazy var emailLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.sizeToFit()
        label.text = "Email:"
        return label
    }()
    
    lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "User name:"
        return label
    }()
    
    lazy var passLabel : UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "Password:"
        return label
    }()
    
    lazy var nameTextField : UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.layer.borderWidth = 0.3
        textField.textAlignment = .center
        return textField
    }()
    
    lazy var passTextField : UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.layer.borderWidth = 0.3
        textField.textAlignment = .center
        return textField
    }()
    
    lazy var emailTextField : UITextField = {
        let textField = UITextField()
        textField.font = UIFont.boldSystemFont(ofSize: 18)
        textField.layer.borderWidth = 0.3
        textField.textAlignment = .center
        return textField
    }()
    
    private lazy var saveButton : UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(onTapSave), for: .touchUpInside)
        return button
    }()
    
    private func setUpLayout(){
        view.sv(emailLabel, nameLabel, nameTextField, emailTextField, saveButton, passLabel, passTextField)
        emailLabel.centerVertically().Leading == view.Leading + 40
        
        nameLabel.Leading == emailLabel.Leading
        nameLabel.Top == emailLabel.Bottom + 40
        
        passLabel.Leading == emailLabel.Leading
        passLabel.Top == nameLabel.Bottom + 40
        
        emailTextField.centerVertically().Leading == emailLabel.Trailing + 35
        emailTextField.width(250).height(35)
        
        nameTextField.Leading == emailTextField.Leading
        nameTextField.Width == emailTextField.Width
        nameTextField.Height == emailTextField.Height
        nameTextField.Top == emailTextField.Bottom + 35
        
        passTextField.Leading == emailTextField.Leading
        passTextField.Width == emailTextField.Width
        passTextField.Height == emailTextField.Height
        passTextField.Top == nameTextField.Bottom + 35
        
        saveButton.centerHorizontally().width(150).height(45)
        saveButton.Bottom == view.safeAreaLayoutGuide.Bottom - 30
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpLayout()
    }
    
    @objc func onTapSave(){
        guard let _email = emailTextField.text, let _pass = passTextField.text, let _name = nameTextField.text else { return }
    //NOTE: Nếu ko sửa gì mà ấn Save thì thông báo lỗi
        if _email == currentUser.email && _pass == currentUser.password && _name == currentUser.fullName {
            self.showAlert(_title: "Oops!", _message: "Data didn't change", type: false)
        }
    //Bắt đầu edit
        else{
            let parameters: Parameters = [
                "email": _email,
                "password": _pass,
                "full_name": _name
            ]
            Alamofire.request("http://localhost/demo_server/update.php",
                              method: HTTPMethod.post,
                              parameters: parameters,
                              encoding: URLEncoding.httpBody,
                              headers: nil).responseJSON { (response) in
                                switch response.result{
                                case.failure(_):
                                    break
                                case.success(let value):
                                    let _json = JSON(value)
                                    let userJSON = _json["message"].stringValue
                                    self.handleInsert(_msg: userJSON)
                                    print(userJSON)
                                }
            }
        }
    //-----------------------------------
    }
//NOTE: Đoạn này ý tưởng giống với Insert
    func handleInsert(_msg : String){
        showAlert(_title: "Congratulation!", _message: "Update success", type: true)
    }
    
    func showAlert(_title : String, _message : String, type : Bool){
        let alert = UIAlertController(title: _title, message: _message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            if type == false {
                return
            }else{
                self.navigationController?.popViewController(animated: true)
                let mainScreen = self.navigationController?.topViewController as? MainScreen
                guard let _pass = self.passTextField.text, let _name = self.nameTextField.text else {
                    return
                }
                mainScreen?.dataArray[self._index].fullName = _name
                mainScreen?.dataArray[self._index].password = _pass
                mainScreen?.mainTableView.reloadData()
            }
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
//--------------------------------------------------------
}
