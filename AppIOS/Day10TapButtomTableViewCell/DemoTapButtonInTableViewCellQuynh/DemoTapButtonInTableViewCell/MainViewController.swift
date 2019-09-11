//
//  MainViewController.swift
//  DemoTapButtonInTableViewCell
//
//  Created by Taof on 9/5/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var answers = [Answer]()
    override func viewDidLoad() {
        super.viewDidLoad()

        createData()
        setupTableView()
    }

    func createData(){
        let answer1 = Answer(answer: "Việt Nam thắng Thái Lan", isSelect: true)
        let answer2 = Answer(answer: "Việt Nam hoà Thái Lan", isSelect: false)
        let answer3 = Answer(answer: "Việt Nam thua Thái Lan", isSelect: false)
        
        answers = [answer1, answer2, answer3]
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "myCell")
        
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        tableView.bounces = false
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyCell
        
        cell.answer = answers[indexPath.row]
        // hứng closure
        cell.start = { [weak self] in
            guard let strongSelf = self else {
                return
            }
            
            // toggle() là để nghịch đảo giá trị
            strongSelf.answers[indexPath.row].isSelect.toggle()
            tableView.reloadData()
        }
        
        cell.truyenName = { (name, age) in
            print(name)
            print(age)
        
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
}
