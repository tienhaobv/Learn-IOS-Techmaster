//
//  CustomCell_1.swift
//  Excercise_CollectionView
//
//  Created by Cuong  Pham on 8/26/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import UIKit
import Stevia

class CustomCell_1: UICollectionViewCell {
    
    lazy var titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.numberOfLines = 2
        label.sizeToFit()
        return label
    }()
    
    lazy var authorLabel : UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 18)
        label.sizeToFit()
        return label
    }()
    
    lazy var mainImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    
    
    fileprivate func setUpLayout(){
        self.sv(mainImage)
        mainImage.width(100%).height(90%).centerHorizontally()
        mainImage.Bottom == self.Bottom
        
        mainImage.sv(authorLabel, titleLabel)
        authorLabel.Leading == mainImage.Leading + 10
        authorLabel.Bottom == mainImage.Bottom - 10
        
        titleLabel.Leading == mainImage.Leading + 10
        titleLabel.Bottom == authorLabel.Top - 10
        titleLabel.Trailing == mainImage.Trailing - 10
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //self.backgroundColor = .white
        setUpLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    func configureCell(_data_1 : Data_1){
        self.titleLabel.text = _data_1.title
        self.authorLabel.text = _data_1.author
        self.mainImage.image = _data_1.image
    }
}
