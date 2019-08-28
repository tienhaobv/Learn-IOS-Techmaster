//
//  FriendTVCell.swift
//  UITableViewDemo
//
//  Created by Ba Thoc on 8/20/19.
//  Copyright © 2019 Ba Thoc. All rights reserved.
//

import UIKit
import Stevia

class FriendTVCell: UITableViewCell {

    let avatar: UIImageView = UIImageView()
    let name: UILabel = UILabel()

//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//        print("awakeFromNib")
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

    override init(style : UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        sv(
            avatar,
            name
        )
        self.height(90)

        name.font = UIFont.boldSystemFont(ofSize: 24)
        name.textColor = UIColor.black
        avatar.size(80).centerVertically()
        avatar.layer.cornerRadius = 40
        avatar.clipsToBounds = true
        align(horizontally: |-20-avatar-name-20-|)

    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
