//
//  MainScreen.swift
//  login_with_server
//
//  Created by Cuong  Pham on 9/17/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import UIKit
import Stevia
import Alamofire
import SwiftyJSON

class MainScreen: UIViewController {
    private let service = UserService()
     var dataArray : Array<User> = []
    lazy var mainTableView : UITableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        service.delegate = self
        //NOTE: load user từ server. Dòng này phải đặt trong viewDidLoad, nếu đặt trong viewDidAppear hoặc viewWillAppear thì sẽ dẫn đến hiện tượng đuplicate dữ liệu
        self.service.loadUser()
        //------------------------
        setUpTableView()
        view.backgroundColor = .lightGray
    }
    
    private func setUpTableView(){
        view.sv(mainTableView)
        
        navigationItem.title = "All User"
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .add, target: self, action: #selector(onTapAdd))
        
        mainTableView.Top == view.safeAreaLayoutGuide.Top
        mainTableView.centerHorizontally().width(100%).Bottom == view.safeAreaLayoutGuide.Bottom
        
        mainTableView.delegate = self
        mainTableView.dataSource = self
        mainTableView.register(UserCell.self, forCellReuseIdentifier: "User")
        
        mainTableView.bounces = false
        mainTableView.tableFooterView = UIView()
    }
    
    @objc func onTapAdd(){
        let nextVC = AddScreen()
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.async {
            self.mainTableView.reloadData()
        }
    }
}


extension MainScreen : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = mainTableView.dequeueReusableCell(withIdentifier: "User", for: indexPath) as? UserCell else {
            fatalError("fail")
        }
        cell.emailLabel.text = dataArray[indexPath.row].email
        cell.nameLabel.text = dataArray[indexPath.row].fullName
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //NOTE: Truyền các dữ liệu sang màn edit
        let nextVC = EditScreen()
        nextVC._index = indexPath.row
        nextVC.currentUser = self.dataArray[indexPath.row]
        nextVC.emailTextField.text = self.dataArray[indexPath.row].email
        nextVC.nameTextField.text = self.dataArray[indexPath.row].fullName
        nextVC.passTextField.text = self.dataArray[indexPath.row].password
        self.navigationController?.pushViewController(nextVC, animated: true)
    //-----------------------------------------
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
    //NOTE: DELETE
        guard let _email = dataArray[indexPath.row].email else { fatalError() }
        let para : Parameters = [
            "email" : _email
        ]
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
        //NOTE: Show alert hỏi người dùng có chắc chắn xóa ko, nếu OK thì xóa
            let alert = UIAlertController(title: "Warning", message: "Do you want to delete it?", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let okAction = UIAlertAction(title: "OK", style: .destructive, handler: { (_) in
            //NOTE: Request delete lên server và xử lý
                Alamofire.request("http://localhost/demo_server/delete.php",
                                  method: HTTPMethod.post,
                                  parameters: para,
                                  encoding: URLEncoding.httpBody,
                                  headers: nil).responseJSON { (response) in
                                    switch response.result{
                                    case.failure(_):
                                        break
                                    case.success(let value):
                                        let _json = JSON(value)
                                        let userJSON = _json["message"].stringValue
                                    //NOTE: show alert thông báo cho người dùng đã xóa thành công
                                        let alert = UIAlertController(title: "Success", message: "Delete \(_email) successfully", preferredStyle: .alert)
                                        //NOTE: khi người dùng tap OK, xóa phần tử trong mảng dataArray và xóa row của table view, sau đó reloadData cho chắc cốp
                                        let okAction = UIAlertAction(title: "OK", style: .default, handler: { (_) in
                                            self.dataArray.remove(at: indexPath.row)
                                            self.mainTableView.deleteRows(at: [indexPath], with: .fade)
                                            self.mainTableView.reloadData()
                                        })
                                        //--------------------------------------------
                                        alert.addAction(okAction)
                                        self.present(alert, animated: true, completion: nil)
                                        print(userJSON)
                                    //------------------------------------
                                    }
                }
            //----------------------
            })
            alert.addAction(cancelAction)
            alert.addAction(okAction)
            self.present(alert, animated: true, completion: nil)
        }
        //---------------------------------------------------------
        return [deleteAction]
    //-------------------------------------------
    }
}

extension MainScreen : UserServiceDelegate {
    func loadUserSuccess(data: [User]) {
        self.dataArray = data
        self.mainTableView.reloadData()
    }
    
    func loadUserFail(error: Error) {
        print(error)
        let alert = UIAlertController(title: "Oops", message: "Load fail", preferredStyle: .actionSheet)
        self.present(alert, animated: true, completion: nil)
    }
}
