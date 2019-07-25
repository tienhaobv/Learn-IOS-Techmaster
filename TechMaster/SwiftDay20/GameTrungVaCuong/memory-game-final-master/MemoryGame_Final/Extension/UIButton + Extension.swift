//
//  UIButton + Extension.swift
//  MemoryGame_Final
//
//  Created by Cuong  Pham on 7/3/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import Foundation
import UIKit

extension UIButton{
    convenience init(parrentView : UIView, name : String!, topEqual : NSLayoutAnchor<NSLayoutYAxisAnchor>){
        self.init()
        parrentView.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalTo: parrentView.widthAnchor, multiplier: 3/4).isActive = true
        self.heightAnchor.constraint(equalToConstant: UIDevice.setSixe(iPhone: 45, iPad: 90)).isActive = true
        self.centerXAnchor.constraint(equalTo: parrentView.centerXAnchor).isActive = true
        self.topAnchor.constraint(equalTo: topEqual, constant: UIDevice.setSixe(iPhone: 40, iPad: 80)).isActive = true
        self.setTitle(name, for: .normal)
        self.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: UIDevice.setSixe(iPhone: 20, iPad: 40))
        self.layer.cornerRadius = UIDevice.setSixe(iPhone: 10, iPad: 20)
    }
    
    convenience init(parrentView : UIView, nameImage : String, topEqual : NSLayoutAnchor<NSLayoutYAxisAnchor>){
        self.init()
        parrentView.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.setBackgroundImage(UIImage(named: nameImage), for: .normal)
        self.centerXAnchor.constraint(equalTo: parrentView.centerXAnchor).isActive = true
        self.widthAnchor.constraint(equalToConstant: UIDevice.setSixe(iPhone: 45, iPad: 90)).isActive = true
        self.heightAnchor.constraint(equalToConstant: UIDevice.setSixe(iPhone: 45, iPad: 90)).isActive = true
        self.topAnchor.constraint(equalTo: topEqual, constant: UIDevice.setSixe(iPhone: 50, iPad: 100)).isActive = true
    }
}
