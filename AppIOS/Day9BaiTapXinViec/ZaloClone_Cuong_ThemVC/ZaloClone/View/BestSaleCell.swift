//
//  BestCellSale.swift
//  ZaloClone
//
//  Created by Cuong  Pham on 8/29/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//
import Stevia
import UIKit

class BestSaleCell: UICollectionViewCell {
    lazy var mainImage : UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    lazy var priceLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .red
        label.sizeToFit()
        return label
    }()
    
    lazy var saleLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .white
        label.textAlignment = .center
        label.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        return label
    }()
    
    fileprivate func setUpLayout(){
        self.sv(mainImage, nameLabel, priceLabel, saleLabel)
        
        mainImage.centerHorizontally().width(80%).height(70%)
        mainImage.Top == self.Top
        
        nameLabel.Leading == self.Leading
        nameLabel.Trailing == self.Trailing
        nameLabel.height(10%)
        nameLabel.Bottom == self.Bottom
        
        priceLabel.centerHorizontally()
        priceLabel.Bottom == nameLabel.Top - 5
        
        //mainImage.sv(saleLabel)
        saleLabel.Top == mainImage.Top
        saleLabel.Trailing == mainImage.Trailing
        saleLabel.width(50).height(40)
    }
    
    func updateData(_bestSale : BestSale){
        self.nameLabel.text = _bestSale.name
        self.mainImage.image = _bestSale.image
        self.saleLabel.text = _bestSale.sale
        self.priceLabel.text = _bestSale.price
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
