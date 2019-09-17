//
//  QuestionCell.swift
//  Quiz_App
//
//  Created by Cuong  Pham on 9/9/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import UIKit
import Stevia

class QuestionCell: UICollectionViewCell {
    
    var _data = Array<String>()
    var _right : String!
    
    lazy var contentQuestionLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.sizeToFit()
        return label
    }()
    
    lazy var subView : UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()
    
    var tableView : UITableView = UITableView()
    
    fileprivate func setUpLayout(){
        self.sv(subView)
        subView.Top == self.Top
        subView.centerHorizontally().width(100%).height(20%)
        
        subView.sv(contentQuestionLabel)
        contentQuestionLabel.centerInContainer()
    }
    
    fileprivate func setUpTableView(){
        self.sv(tableView)
        tableView.centerHorizontally().width(100%).height(80%)
        tableView.Top == subView.Bottom
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(AnswerCell.self, forCellReuseIdentifier: "Answer")
       // tableView.allowsSelection = false
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setUpLayout()
        setUpTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension QuestionCell : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Answer", for: indexPath) as? AnswerCell else {
            fatalError("fail")
        }
        cell.contentAnswerLabel.text = _data[indexPath.row]
        
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height / 4
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Your choose: \(_data[indexPath.row])")
        print("Answer: \(_right!)")
        
        if _data[indexPath.row] == _right {
            MainScreen.acceptLabel.isHidden = false
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                MainScreen.acceptLabel.isHidden = true
            }
        }
    }
}
