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
    
    let tableDB = UITableView()
    let scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentSize.height = 1000
        scrollView.backgroundColor = UIColor.white
        return scrollView
    }()
    var searchbar = SearchBarDanhba()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
//        setupSecrchBar()
        view.sv(
            searchbar,
            scrollView.sv(
                tableDB
            )
        )
        scrollView.sv(
            |tableDB|
        )
        view.layout(
            |searchbar| ~ 50,
            |scrollView|
        )
        searchbar.Top == view.safeAreaLayoutGuide.Top
        scrollView.Bottom == view.safeAreaLayoutGuide.Bottom
        tableDB.Bottom == view.safeAreaLayoutGuide.Bottom
        tableDB.dataSource = self // Cho viewcontroller quyền đổ dữ liệu vào
        tableDB.register(CellDanhBa.self, forCellReuseIdentifier: "HeardDBCell")
        tableDB.rowHeight = 90.0
    }
    
    func data() {
        arheadDB[
            UIImageView.i
        ]
    }
    

}
extension DanhBaVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arheadDB.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeardDBCell", for: indexPath) as! CellDanhBa
        let _headDB = arheadDB[indexPath.row]
        cell.setHeadDB(headDB: _headDB)
        return cell
    }
    
    
}

