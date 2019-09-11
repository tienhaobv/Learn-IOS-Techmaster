//
//  AccountCell.swift
//  ZaloClone
//
//  Created by Cuong  Pham on 8/30/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia

class AccountCell: UITableViewCell {
    
    lazy var avatarImage : UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 40
        image.clipsToBounds = true
        return image
    }()
    
    lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        label.sizeToFit()
        return label
    }()
    
    lazy var infoLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.alpha = 0.8
        label.textColor = .black
        return label
    }()
    
    fileprivate func setUpLayout(){
        self.sv(avatarImage, nameLabel, infoLabel)
        
        avatarImage.Leading == self.Leading + 15
        avatarImage.size(80).centerVertically()
        
        nameLabel.Leading == avatarImage.Trailing + 15
        nameLabel.Top == avatarImage.Top + 5
        
        infoLabel.Leading == nameLabel.Leading
        infoLabel.Trailing == self.Trailing - 10
        infoLabel.Top == nameLabel.Bottom + 10
        infoLabel.height(30)
    }
    
    func setUpData(_account : Account){
        self.avatarImage.image = _account.avatar
        self.nameLabel.text = _account.name
        self.infoLabel.text = _account.info
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUpLayout()
        // Configure the view for the selected state
    }

}
