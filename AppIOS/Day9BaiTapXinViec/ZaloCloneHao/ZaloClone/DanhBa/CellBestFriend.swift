//
//  CellBestFriend.swift
//  ZaloClone
//
//  Created by Ba Thoc on 9/6/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia

class CellBestFriend: UITableViewCell {

    let imgAvatar = UIImageView()
    
    let name: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont.systemFont(ofSize: 18)
        return lbl
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
            imgCall,
            imgVideoCall
        )
        
        layout(
            |-20-imgAvatar.centerVertically().size(60)-20-name-(>=30)-imgCall-20-imgVideoCall-20-|
            //            |-20-imgAvatar.centerVertically().size(60)-20-name-|
        )
        
        //        imgAvatar.centerVertically().size(60)
        imgAvatar.layer.cornerRadius = 30
        imgAvatar.clipsToBounds = true
        imgCall.size(30)
        imgVideoCall.height(30)
        imgVideoCall.width(40)
    }
    
    func setCellBestFriends(bestFriend: BestFriend) {
        imgAvatar.image = bestFriend.imgAvatar
        name.text = bestFriend.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
