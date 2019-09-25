//
//  UserCell.swift
//  login_with_server
//
//  Created by Cuong  Pham on 9/17/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import UIKit
import Stevia

class UserCell: UITableViewCell {
    
    lazy var _emailLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.sizeToFit()
        label.text = "Email:"
        return label
    }()
    
    lazy var _nameLabel : UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        label.text = "User name:"
        return label
    }()
    
    lazy var emailLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .black
        label.sizeToFit()
        return label
    }()
    
    lazy var nameLabel : UILabel = {
       let label = UILabel()
        label.sizeToFit()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    fileprivate func setUpLayoutForCell(){
        self.sv(emailLabel, nameLabel, _nameLabel, _emailLabel)
        _emailLabel.Top == self.Top + 10
        _emailLabel.Leading == self.Leading + 30
        
        _nameLabel.Top == _emailLabel.Bottom + 20
        _nameLabel.Leading == _emailLabel.Leading
        
        emailLabel.Top == _emailLabel.Top
        emailLabel.Leading == _emailLabel.Trailing + 40
        
        nameLabel.Top == _nameLabel.Top
        nameLabel.Leading == emailLabel.Leading
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setUpLayoutForCell()
        // Configure the view for the selected state
    }

}
