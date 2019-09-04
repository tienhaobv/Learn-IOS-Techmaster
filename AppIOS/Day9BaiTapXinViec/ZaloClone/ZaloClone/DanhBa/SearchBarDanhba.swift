//
//  SearchBarDanhba.swift
//  ZaloClone
//
//  Created by Ba Thoc on 8/29/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia

class SearchBarDanhba: UIView {
    var gradientLayer :  CAGradientLayer!
    let searchbar = UIView()
    let imgSearch: UIImageView = UIImageView(image: UIImage(named: "search")!)
    
    let tfSearch: UITextField = {
        let tf = UITextField()
            tf.font = UIFont.systemFont(ofSize: 24)
            tf.placeholder("Tìm bạn bè, tin nhắn ...")
            tf.textColor = UIColor.white
        return tf
    }()
    
    let btnAddFriend: UIButton = {
        let btn = UIButton()
        btn.text("")
        btn.setImage(UIImage(named: "icons8-plus-math-50"), for: .normal)
        return btn
    }()
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        if gradientLayer == nil {
            gradientLayer = CAGradientLayer()
            gradientLayer.frame = rect
            
            gradientLayer.colors = [UIColor(red:0.09, green:0.47, blue:1.00, alpha:1.0).cgColor, UIColor(red:0.00, green:0.73, blue:0.99, alpha:1.0).cgColor]
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
            self.layer.addSublayer(gradientLayer)
            self.sv(
                imgSearch,
                tfSearch,
                btnAddFriend
            )
            self.layout(
                10,
                |-10-imgSearch.size(30)-20-tfSearch-(>=10)-btnAddFriend-|
            )
        }
    }

}
