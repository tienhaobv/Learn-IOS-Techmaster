

import UIKit
import Stevia

class CustomCell_2: UICollectionViewCell {
    lazy var mainImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var numberImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var featureImage : UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    lazy var nameLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = .white
        label.sizeToFit()
        return label
    }()
    
    fileprivate func setUpLayout(){
        self.sv(mainImage, nameLabel)
        
        mainImage.centerHorizontally().width(90%).height(70%)
        mainImage.Top == self.Top + 5
        
        nameLabel.centerHorizontally()
        nameLabel.Top == mainImage.Bottom + 10
        
        mainImage.sv(numberImage, featureImage)
        numberImage.size(35)
        numberImage.Top == mainImage.Top + 5
        numberImage.Trailing == mainImage.Trailing - 5
        
        featureImage.size(30)
        featureImage.Bottom == mainImage.Bottom
        featureImage.Trailing == mainImage.Trailing - 5
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
    }
    
    func configureCell(_data : Data_2){
        self.mainImage.image = _data.image
        self.nameLabel.text = _data.name
        self.numberImage.image = _data.number
        self.featureImage.image = _data.featured
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
