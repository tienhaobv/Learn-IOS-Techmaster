//
//  CellNewFriends.swift
//  ZaloClone
//
//  Created by Ba Thoc on 9/4/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia

class CellNewFriends: UITableViewCell {

    let imgAvatar: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    let name: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 18)
        return lbl
    }()
    
    enum status {
        case new
        case old
        
        var icon: UIImage {
            switch self {
            case .new:
                return #imageLiteral(resourceName: "imgNewFriend")
            case .old:
                return #imageLiteral(resourceName: "BmOld")
            }
        }
    }
    
    var imgStatus: UIImageView = {
        let img = UIImageView()
        return img
    }()
    
    var imgCall: UIButton = {
        let img = UIButton()
        return img
    }()
    
    var imgVideoCall: UIButton = {
        let img = UIButton()
        //test
        img.addTarget(self, action: #selector(onTap), for: .touchUpInside)
        return img
    }()
    
    @objc func onTap(){
        print("a")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        imgCall.setImage(UIImage(named: "BmCall"), for: .normal)
        imgVideoCall.setImage(UIImage(named: "BmVideoCall"), for: .normal)
        
        sv(
            imgAvatar,
            name,
            imgStatus,
            imgCall,
            imgVideoCall
        )
        
        layout(
            |-20-imgAvatar.centerVertically().size(60)-20-name-(>=10)-imgStatus-30-imgCall-20-imgVideoCall-20-|
//            |-20-imgAvatar.centerVertically().size(60)-20-name-|
        )
        
//        imgAvatar.centerVertically().size(60)
        imgAvatar.layer.cornerRadius = 30
        imgAvatar.clipsToBounds = true
        imgStatus.height(20)
        imgStatus.width(50)
        imgCall.size(30)
        imgVideoCall.height(30)
        imgVideoCall.width(40)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setCellNewFriends(newFriend: NewfirendDB, _status: status) {
        imgAvatar.image = newFriend.imgAvartar
        name.text = newFriend.name
        imgStatus.image = _status.icon
    }
}
