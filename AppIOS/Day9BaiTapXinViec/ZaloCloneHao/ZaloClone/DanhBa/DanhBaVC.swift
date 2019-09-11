//
//  DanhBaVC.swift
//  TabBarNavigationController
//
//  Created by Techmaster on 5/21/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia

class DanhBaVC: UIViewController {
    
    var arheadDB: [HeadDB]!
    var arNewFriendDB: [NewfirendDB]!
    var arBestFriendDB: [BestFriend]!
    
    let tableDB = UITableView()
    let newFirendTB = UITableView()
    let viewBestFriend = UIView()
    let bestFirendTB = UITableView()
    let viewBotBestFriend = UIView()
    let btnAddBestFriend = UIButton()
    let lblAddBestFriend = UILabel()
    let lblTitleAddBestFriend = UILabel()
    let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize.height = 1000
        scrollView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.1)
        return scrollView
    }()
    var searchbar = SearchBarDanhba()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data()
        view.backgroundColor = .white
        //        setupSecrchBar()
        view.sv(
            searchbar,
            scrollView.sv(
                tableDB,
                newFirendTB,
                viewBestFriend.sv(
                    lblTitleAddBestFriend,
                    bestFirendTB,
                    viewBotBestFriend
                )
            )
        )
        view.layout(
            |searchbar| ~ 50,
            |scrollView|
        )
        searchbar.Top == view.safeAreaLayoutGuide.Top
        scrollView.Bottom == view.safeAreaLayoutGuide.Bottom
        //        scrollView.sv(tableDB)
        tableDB.Top == scrollView.Top
        tableDB.width(100%).centerHorizontally().height(180)
        tableDB.separatorStyle = .none
        tableDB.backgroundColor = .red
        tableDB.dataSource = self // Cho viewcontroller quyền đổ dữ liệu vào
        tableDB.register(CellDanhBa.self, forCellReuseIdentifier: "HeardDBCell")
        tableDB.rowHeight = 90.0
        
        newFirendTB.Top == tableDB.Bottom + 10
        newFirendTB.width(100%).centerHorizontally().height(CGFloat(arNewFriendDB.count*90))
        newFirendTB.separatorStyle = .none
        newFirendTB.backgroundColor = .blue
        newFirendTB.dataSource = self
        newFirendTB.register(CellNewFriends.self, forCellReuseIdentifier: "NewFriendCell")
        newFirendTB.rowHeight = 90
        
        viewBestFriend.Top == newFirendTB.Bottom + 10
        viewBestFriend.backgroundColor = .white
        viewBestFriend.width(100%).centerHorizontally().height(CGFloat(arBestFriendDB.count*90)+120)
        
        lblTitleAddBestFriend.Leading == viewBestFriend.Leading + 15
        lblTitleAddBestFriend.Top == viewBestFriend.Top + 10
        lblTitleAddBestFriend.text("Bạn thân")
        
        bestFirendTB.Top == lblTitleAddBestFriend.Bottom + 10
        bestFirendTB.width(100%).centerHorizontally().height(CGFloat(arBestFriendDB.count*90))
        bestFirendTB.separatorStyle = .none
        bestFirendTB.backgroundColor = .green
        bestFirendTB.dataSource = self
        bestFirendTB.register(CellBestFriend.self, forCellReuseIdentifier: "BestFriendCell")
        bestFirendTB.rowHeight = 90
        
        viewBotBestFriend.Top == bestFirendTB.Bottom
        viewBotBestFriend.width(100%).centerHorizontally().height(90)
        viewBotBestFriend.sv(
            btnAddBestFriend,lblAddBestFriend
        )
        btnAddBestFriend.image("BtIconAdd").text("")
        btnAddBestFriend.Leading == viewBotBestFriend.Leading + 20
        btnAddBestFriend.centerVertically().size(60)
        btnAddBestFriend.layer.cornerRadius = 30
        btnAddBestFriend.clipsToBounds = true
        lblAddBestFriend.text("Thêm bạn thân")
        lblAddBestFriend.textColor = UIColor(red:0.00, green:0.55, blue:1.00, alpha:1.0)
        lblAddBestFriend.Left == btnAddBestFriend.Right + 20
        lblAddBestFriend.centerVertically()
        lblAddBestFriend.Trailing == viewBotBestFriend.Trailing - 10
        //        viewBotBestFriend.layout(
        //            |-20-btnAddBestFriend.centerVertically()-30-lblAddBestFriend-10-|
        //        )
        
    }
    
    func data() {
        arheadDB = [
            HeadDB(_imgIcon: UIImage(named: "iconGY")!, _title: "Gợi ý kết bạn"),
            HeadDB(_imgIcon: UIImage(named: "iconCall")!, _title: "Bạn từ danh bạ máy")
        ]
        
        arNewFriendDB = [
            NewfirendDB(_imgAvartar: UIImage(named: "BmIcon1")!, _name: "Hoàng Mạnh Dũng"),
            NewfirendDB(_imgAvartar: UIImage(named: "BmIcon2")!, _name: "Nguyen Duy Phong"),
            NewfirendDB(_imgAvartar: UIImage(named: "BmIcon3")!, _name: "Sơn Nông Nguyễn")
        ]
        
        arBestFriendDB = [
            BestFriend(_imgAvatar: UIImage(named: "BtIcon")!, _name: "Ông Cao Thắng")
        ]
    }
    
    
}
extension DanhBaVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case tableDB:
            return arheadDB.count
        case newFirendTB:
            return arNewFriendDB.count
        case bestFirendTB:
            return arBestFriendDB.count
        default:
            return 404
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case tableDB:
            
            print("tableDB")
            let cell = tableView.dequeueReusableCell(withIdentifier: "HeardDBCell", for: indexPath) as! CellDanhBa
            let _headDB = arheadDB[indexPath.row]
            cell.setHeadDB(headDB: _headDB)
            return cell
        case newFirendTB:
            print("newFriend")
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewFriendCell", for: indexPath) as! CellNewFriends
            let _newfriendDB = arNewFriendDB[indexPath.row]
            cell.setCellNewFriends(newFriend: _newfriendDB, _status: CellNewFriends.status.new)
            return cell
        case bestFirendTB:
            print("bestFirendTB")
            let cell = tableView.dequeueReusableCell(withIdentifier: "BestFriendCell", for: indexPath) as! CellBestFriend
            let _bestfriendDB = arBestFriendDB[indexPath.row]
            cell.setCellBestFriends(bestFriend: _bestfriendDB)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    
}

