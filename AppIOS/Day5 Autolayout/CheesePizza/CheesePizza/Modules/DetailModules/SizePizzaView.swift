//
//  SizePizzaView.swift
//  CheesePizza
//
//  Created by Tào Quỳnh on 5/21/19.
//  Copyright © 2019 Tào Quỳnh. All rights reserved.
//

import UIKit
import Stevia

class SizePizzaView: UIView {

    let leftView: UIView = {
       let view = UIView()
        view.backgroundColor = .clear
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.cornerRadius = 10
        return view
    }()
    
    let rightView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.cornerRadius = 10
        return view
    }()
    
    let checkImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "check")
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = image.frame.width/2
        return image
    }()
    
    let pizzaImageRed: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pizza-red")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let pizzaImageGray: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pizza-gray")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let sizeLLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Size L"
        return label
    }()
    
    let sizeMLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.text = "Size M"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect.zero)
        
        self.sv(
            leftView.sv(
                checkImage,
                pizzaImageRed,
                sizeLLabel
            ),
            rightView.sv(
                pizzaImageGray,
                sizeMLabel
            )
        )
        self.layout(
            0,
            |-0-leftView-16-rightView-0-|,
            0
        )
        
        leftView.layout(
            (-8),
            |-checkImage.size(20)-(-8)-|
        )
        
        leftView.layout(
            8,
            |-pizzaImageRed-|,
            |-sizeLLabel-|,
            8
        )
        
        rightView.layout(
            8,
            |-pizzaImageGray-|,
            |-sizeMLabel-|,
            8
        )
        
        leftView.Width == rightView.Width
        leftView.Height == rightView.Height
        leftView.Width == rightView.Height
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
