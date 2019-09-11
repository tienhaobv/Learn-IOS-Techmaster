//
//  StickerCell.swift
//  ZaloClone
//
//  Created by Cuong  Pham on 8/30/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//
import Stevia
import UIKit

class StickerCell: UICollectionViewCell {
    lazy var mainImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18)
        label.textAlignment = .center
        return label
    }()
    
    fileprivate func setUpLayout(){
        self.sv(mainImage, nameLabel)
        
        mainImage.centerHorizontally().width(90%).height(70%)
        mainImage.Top == self.Top
        
        nameLabel.centerHorizontally().width(100%).height(35)
        nameLabel.Top == mainImage.Bottom + 10
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
    func updateData(_sticker : Sticker){
        self.mainImage.image = _sticker.image
        self.nameLabel.text = _sticker.name
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
