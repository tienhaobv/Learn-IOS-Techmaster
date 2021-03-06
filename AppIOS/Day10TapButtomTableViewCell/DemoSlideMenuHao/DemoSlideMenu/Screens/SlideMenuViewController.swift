//
//  SlideMenuViewController.swift
//  AppQuiz
//
//  Created by Taof on 8/28/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class SlideMenuViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var menus = [Menu]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        createData()
        setupTableView()
    }

    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.bounces = false
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "MenuCell", bundle: nil), forCellReuseIdentifier: "cell")
    }
    
    func createData(){
        let cell1 = Menu(icon: "quiz", name: "Home", identifier: "MainViewController")
        let cell2 = Menu(icon: "learn", name: "Luyện tập", identifier: "LearnViewController")
        let cell3 = Menu(icon: "history", name: "Lịch sử", identifier: "HistoryViewController")
        let cell4 = Menu(icon: "manual", name: "Hướng dẫn sử dụng", identifier: "WebViewController")
        
        menus = [cell1, cell2, cell3, cell4]
    }
}

extension SlideMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menus.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuCell
        cell.menu = menus[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 80))
        
        imageView.image = UIImage(named: "quizTime")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // lấy menu theo index
        let menu = menus[indexPath.row]
        print("menu: \(menu)")
        // lấy ra project ( Định danh)
        let nameVC = Bundle.main.infoDictionary![kCFBundleNameKey as String] as! String
        print("nameVC: \(nameVC)")
        // lấy ra tên class ViewController cần khởi tạo
        let identifier = nameVC + "." + menu.identifier
        print("identifier: \(identifier)")
        // ép kiểu string thành class
        let viewControllerClass = NSClassFromString(identifier) as! UIViewController.Type
        
        // khởi tạo ViewController
        let detailScreen = viewControllerClass.init()
        detailScreen.title = menu.name
        
        // khởi tạo navigationCOntroller
        let navigation = UINavigationController(rootViewController: detailScreen)
        self.slideMenuController()?.changeMainViewController(navigation, close: true)
        
    }
    

}
