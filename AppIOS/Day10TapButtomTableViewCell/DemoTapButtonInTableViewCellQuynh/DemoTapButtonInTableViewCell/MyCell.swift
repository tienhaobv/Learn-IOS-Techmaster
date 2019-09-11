//
//  MyCell.swift
//  DemoTapButtonInTableViewCell
//
//  Created by Taof on 9/5/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class MyCell: UITableViewCell {

    @IBOutlet weak var selectButton: UIButton!
    @IBOutlet weak var answerLabel: UILabel!
    
    // tạo một closure
    var start: (() -> Void)?
    var truyenName: ((String, Int) -> Void)?
    var answer: Answer? {
        didSet{
            if let _answer = answer {
                answerLabel.text = _answer.answer
                selectButton.setImage(UIImage(named: _answer.isSelect ? "ic_checked" : "ic_uncheck"), for: .normal)
            }
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    @IBAction func tapSelect(_ sender: Any) {
        print("tap nút")
        start?()
        truyenName?("This", 4)
    }
    
    
    
}
