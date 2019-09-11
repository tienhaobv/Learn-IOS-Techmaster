//
//  tableViewC.swift
//  DemoTapButtomTableViewCell
//
//  Created by Ba Thoc on 9/5/19.
//  Copyright © 2019 com.3bgroup. All rights reserved.
//

import UIKit

class tableViewC: UIViewController {

    @IBOutlet weak var tbView: UITableView!
    
    var answer = [Answer]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        data()
        tbView.dataSource = self
        tbView.delegate = self
//        tbView.register(CellTable.self, forCellReuseIdentifier: "CellTable")
        tbView.register(UINib(nibName: "CellTable", bundle: nil), forCellReuseIdentifier: "CellTable")
        
    }


    func data() {
        answer = [
            Answer(answer: "answer1", isSelect: false),
            Answer(answer: "answer2", isSelect: false),
            Answer(answer: "answer3", isSelect: false)
        ]
    }

}
extension tableViewC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return answer.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellTable", for: indexPath) as! CellTable
        cell.answer = answer[indexPath.row]
//        cell.lblDescripsion.text = tbcellData.answer
        
        //hứng closure
        
        cell.strat = { [weak self] in
            guard let
            
        }
        return cell
        
        
    }
    
    
}
