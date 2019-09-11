//
//  ChannelCell.swift
//  ZaloClone
//
//  Created by Cuong  Pham on 8/30/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia

class ChannelCell: UICollectionViewCell {
    lazy var mainImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.alpha = 0.8
        return image
    }()
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.numberOfLines = 2
        
        return label
    }()
    
    fileprivate func setUpLayout(){
        self.sv(mainImage, titleLabel)
        mainImage.width(100%).height(100%).centerInContainer()
        //mainImage.sv(titleLabel)
        titleLabel.Bottom == self.Bottom + 5
        titleLabel.Leading == self.Leading + 3
        titleLabel.Trailing == self.Trailing - 3
        titleLabel.sizeToFit()
        //titleLabel.height(25%)
    }
    
    func updateData(_channel : Channel){
        self.mainImage.image = _channel.image
        self.titleLabel.text = _channel.name
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
