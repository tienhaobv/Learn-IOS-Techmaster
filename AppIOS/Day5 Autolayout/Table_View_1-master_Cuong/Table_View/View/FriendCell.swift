//
//  FriendCell.swift
//  Table_View
//
//  Created by Cuong  Pham on 8/20/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import UIKit
import Stevia

class FriendCell: UITableViewCell {
    
    lazy var avatarImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.sizeToFit()
        return label
    }()
    
    lazy var ratingLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        label.sizeToFit()
        label.text = "✩⭐︎"
        return label
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    fileprivate func autoLayoutForCell(){
        self.sv(avatarImage, nameLabel, ratingLabel)
        
        avatarImage.centerVertically().width(80).height(80)
        avatarImage.Leading == self.Leading + 10
        avatarImage.layer.cornerRadius = 40
        avatarImage.clipsToBounds = true
        
        nameLabel.Top == avatarImage.Top
        nameLabel.Leading == avatarImage.Trailing + 10
        
        ratingLabel.Leading == nameLabel.Leading
        ratingLabel.Top == nameLabel.Bottom + 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        autoLayoutForCell()
        // Configure the view for the selected state
    }

}
