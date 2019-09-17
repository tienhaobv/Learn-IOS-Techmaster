//
//  CellTable.swift
//  DemoTapButtomTableViewCell
//
//  Created by Ba Thoc on 9/5/19.
//  Copyright © 2019 com.3bgroup. All rights reserved.
//

import UIKit

class CellTable: UITableViewCell {

    @IBOutlet weak var btnSelect: UIButton!
    @IBOutlet weak var lblDescripsion: UILabel!
    
    //tạo colosure(dùng để chuyền dữ liệu và hứng sự kiện)
    
    var strat: (() -> Void)?
    
    var answer: Answer? {
        didSet {
            if let ans = answer {
                lblDescripsion.text = ans.answer
                btnSelect.setImage(UIImage(named: ans.isSelect ? "ic_circle" : "ic_done"), for: .normal)
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
    @IBAction func btnClick(_ sender: Any) {
        print("Tap button")
        strat?()
    }
    
}
