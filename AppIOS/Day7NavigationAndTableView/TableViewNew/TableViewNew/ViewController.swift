//
//  ViewController.swift
//  TableViewNew
//
//  Created by Ba Thoc on 8/22/19.
//  Copyright © 2019 Ba Thoc. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //khởi tạo
    let tbView = UITableView()
    var topHeight: CGFloat = 0.0
    var barHeight: CGFloat = 0.0
    var bottomHeight: CGFloat = 0.0
    var items = [Item]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        createData()
        barHeight = navigationController?.navigationBar.frame.height ?? 0.0
        
        if #available(iOS 11.0, *) {
            let window = UIApplication.shared.keyWindow
            topHeight = window?.safeAreaInsets.top ?? 0.0
            bottomHeight = window?.safeAreaInsets.bottom ?? 0.0
        }
        
        title = "Todo List"
        // Thêm một item chuyển qua màn hình thêm item
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addFunc))
        
        setUpTableView()
        
        
        
        // gán delegate
        tbView.delegate = self
        tbView.dataSource = self
        // đằng ký cell
        tbView.register(MyCell.self, forCellReuseIdentifier: "cell")
        //khi gọi cell có giao diện dùng hàm này
        //tbView.register(<#T##nib: UINib?##UINib?#>, forCellReuseIdentifier: <#T##String#>)
        
        //đặt chiều cao tối thiểu cho cell
        tbView.estimatedRowHeight = 64
        tbView.rowHeight = UITableView.automaticDimension
        // cho nó khi kéo xuống hết không bị lên quá
        tbView.bounces = false
        tbView.tableFooterView = UIView()
    }
    
    @objc func addFunc() {
        let createVC = InfoViewController()
        createVC.title = "Thêm mới"
        navigationController?.pushViewController(createVC, animated: true)
    }
    
    func createData() {
        let item1 = Item(name: "Hà Văn Lâu", address: "Việt Nam - Hải Dương", photo: UIImage(named: "burger-bk"))
        let item2 = Item(name: "Lê Quang Anh", address: "Việt Nam - Ninh Bình", photo: UIImage(named: "burger-bk"))
        
        items = [item1, item2]
    }
    
    func setUpTableView() {
        tbView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tbView)
        tbView.topAnchor.constraint(equalTo: view.topAnchor, constant: barHeight+topHeight).isActive = true
        tbView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: bottomHeight).isActive = true
        tbView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        tbView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tbView.backgroundColor = #colorLiteral(red: 0.4239736497, green: 1, blue: 0.5568110347, alpha: 1)
    }
    

}

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    // trả về số dòng của một section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    
    // Hàm trả về nội dung của một cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MyCell
//
//        let myCell = MyCell()
//
//        cell.backgroundColor = .lightGray
//        cell.textLabel?.text = String(indexPath.row)
        cell.photoImageView.image = items[indexPath.row].photo
        cell.nameLabel.text  = items[indexPath.row].name
        cell.addressLabel.text = items[indexPath.row].address
        return cell
    }
}

