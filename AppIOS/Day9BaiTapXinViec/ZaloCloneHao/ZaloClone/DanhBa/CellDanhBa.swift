//
//  CellDanhBa.swift
//  ZaloClone
//
//  Created by Ba Thoc on 8/29/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia

class CellDanhBa: UITableViewCell {
    
    let imgIconCell: UIImageView = {
        let image = UIImageView()
        return image
    }()
    let titleCell: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        sv(
            imgIconCell,
            titleCell
        )
        
        layout(
            |-20-imgIconCell.size(60).centerVertically()-20-titleCell-|
        )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    
    func setHeadDB(headDB: HeadDB) {
        imgIconCell.image = headDB.imgIcon
        titleCell.text = headDB.title
    }
    
}
