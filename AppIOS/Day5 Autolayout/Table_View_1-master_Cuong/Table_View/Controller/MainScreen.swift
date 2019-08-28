//
//  MainScreen.swift
//  Table_View
//
//  Created by Cuong  Pham on 8/20/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import UIKit
import Stevia

class MainScreen: UIViewController {
    
    var tableView : UITableView = UITableView()
    var headerView : HeaderView = HeaderView()
    var nameTextField : UITextField = UITextField()
    
    static var data = [
        Friends(name: "Nguyen Van A", imageName: "ho", image: UIImage(), rating: 1),
        Friends(name: "Nguyen Thi C", imageName: "khung-long", image: UIImage(), rating: 2),
        Friends(name: "Tran Thi E", imageName: "ngua", image: UIImage(), rating: 3),
        Friends(name: "Phung Thi G", imageName: "ech", image: UIImage(), rating: 4),
        Friends(name: "Doan Van H", imageName: "bo", image: UIImage(), rating: 5)
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 0.3254901961, blue: 0.2196078431, alpha: 0.799604024)
        autoLayoutHeaderView()
        autolayouttableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FriendCell.self, forCellReuseIdentifier: "Cell")
        headerView.addButton.addTarget(self, action: #selector(onTapAddButton), for: .touchUpInside)
    }
    
    @objc func onTapAddButton(){
        let nextScreen = AddScreen()
        self.navigationController?.pushViewController(nextScreen, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    fileprivate func autoLayoutHeaderView(){
        view.sv(headerView)
        headerView.centerHorizontally().width(100%).height(60)
        headerView.Top == view.safeAreaLayoutGuide.Top
    }
    
    fileprivate func autolayouttableView(){
        view.sv(tableView)
        tableView.backgroundColor = .white
        tableView.Top == headerView.Bottom
        tableView.width(100%).centerHorizontally()
        tableView.Bottom == view.safeAreaLayoutGuide.Bottom
    }
}

extension MainScreen : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainScreen.data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? FriendCell else {
            fatalError("fail")
        }
        cell.nameLabel.text = MainScreen.data[indexPath.row].name
        if MainScreen.data[indexPath.row].imageName == "" {
            cell.avatarImage.image = MainScreen.data[indexPath.row].image
        }else{
            cell.avatarImage.image = UIImage(named: MainScreen.data[indexPath.row].imageName)
        }
        cell.ratingLabel.text = ""
        for _ in 1...(MainScreen.data[indexPath.row].rating ?? 1){
            cell.ratingLabel.text = (cell.ratingLabel.text ?? "") + "⭐︎"
        }
      
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let dataCell = MainScreen.data[indexPath.row]
        let editAction = UITableViewRowAction(style: .default, title: "Edit") { (action, indexPath) in
            let nextScreen = EditScreen()
            self.navigationController?.pushViewController(nextScreen, animated: true)
    //truyen du lieu sang EditScreen
            nextScreen.name = dataCell.name
            if dataCell.imageName == "" {
                nextScreen.image = dataCell.image
            }else{
                nextScreen.imageName = dataCell.imageName
            }
            nextScreen.rating = dataCell.rating
            nextScreen._index = indexPath
        }
        editAction.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (action, indexPath) in
            print("delete")
            MainScreen.data.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        deleteAction.backgroundColor = .red

        return [editAction, deleteAction]
    }
}
