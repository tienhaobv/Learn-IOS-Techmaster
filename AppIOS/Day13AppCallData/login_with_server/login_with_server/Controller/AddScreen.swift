//
//  DetailScreen.swift
//  login_with_server
//
//  Created by Cuong  Pham on 9/17/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import UIKit
import Stevia
import Alamofire
import SwiftyJSON

class AddScreen: UIViewController {
    
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
    
    @objc func onTapSave(){
    //NOTE: Insert
        guard let _email = emailTextField.text, let _pass = passTextField.text, let _name = nameTextField.text else {
            return
        }
        let parameters: Parameters = [
            "email": _email,
            "password": _pass,
            "full_name": _name
        ]
        //NOTE: Request lên server
        Alamofire.request("http://localhost/demo_server/insert.php",
                          method: HTTPMethod.post,
                          parameters: parameters,
                          encoding: URLEncoding.httpBody,
                          headers: nil).responseJSON { (response) in
                            switch response.result{
                            case.failure(_):
                                break
                            //print(error)
                            case.success(let value):
                                let _json = JSON(value)
                                let userJSON = _json["message"].stringValue
                                self.handleInsert(msg: userJSON)
                                print(userJSON)
                            }
        }
        //------------------------------------
    //--------------------------------------
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpLayout()
        
        
    }
    
    func handleInsert(msg : String){
        if msg != "success"{
            showAlert(_title: "Oops!", _message: "Insert failed", type: false)
        }else{
            showAlert(_title: "Congratulation", _message: "Insert successfull", type: true)
            
        }
    }
//NOTE: hàm show alert
    func showAlert(_title : String, _message : String, type: Bool){
        let alert = UIAlertController(title: _title, message: _message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
        //NOTE: type = false => insert fail => show alert báo lỗi cho người dùng
            if type == false{
                return
            }
        //NOTE: type = true => insert success => show alert thông báo thành công
            else{
                self.navigationController?.popViewController(animated: true)
                guard let _email = self.emailTextField.text, let _pass = self.passTextField.text, let _name = self.nameTextField.text else {
                    return
                }
            //NOTE: giống phần delete, sau khi đã request insert lên server, ta phải append vào mảng dataArray ở MainScreen sau đó reload lại table view. Nếu ko làm công việc này thì server vẫn có dữ liệu mới nhưng app lại vẫn hiển thị dữ liệu cũ. Ta lại phải tắt app đi build lại.
                let mainScreen = self.navigationController?.topViewController as? MainScreen
                mainScreen?.dataArray.append(User(_email: _email, _pass: _pass, _name: _name))
                mainScreen?.mainTableView.reloadData()
            //----------------------------------------------
            }
        }
        alert.addAction(okAction)
        self.present(alert, animated: true, completion: nil)
    }
//-------------------------------
}
