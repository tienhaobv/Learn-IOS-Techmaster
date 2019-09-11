//
//  FunctionCell.swift
//  ZaloClone
//
//  Created by Cuong  Pham on 8/29/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia

class FunctionCell: UICollectionViewCell {
    
    //var _function : Function!
    
    lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 13)
        label.numberOfLines = 2
        label.sizeToFit()
        label.textColor = .black
        return label
    }()
    
    lazy var image : UIImageView = {
        let _image = UIImageView()
        _image.contentMode = .scaleAspectFit
        return _image
    }()
    
    fileprivate func setUpLayoutForCell(){
        self.sv(nameLabel, image)
        image.centerHorizontally().width(60%).height(70%)
        image.Top == self.Top
        
        nameLabel.centerHorizontally()
        nameLabel.Top == image.Bottom + 5
        nameLabel.Leading == self.Leading
        nameLabel.Trailing == self.Trailing
    }
    
    func setUpDataForCell(function : Function){
        self.nameLabel.text = function.title
        self.image.image = function.image
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.backgroundColor = .cyan
        setUpLayoutForCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
