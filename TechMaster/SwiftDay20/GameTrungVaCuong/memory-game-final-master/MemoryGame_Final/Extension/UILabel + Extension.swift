//
//  UILabel + Extension.swift
//  MemoryGame_Final
//
//  Created by Cuong  Pham on 7/10/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import Foundation
import UIKit
extension UILabel{
    convenience init(parrentView : UIView, text : String){
        self.init()
        parrentView.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.topAnchor.constraint(equalTo: parrentView.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        self.text = text
        self.font = UIFont.boldSystemFont(ofSize: UIDevice.setSixe(iPhone: 20, iPad: 40))
        self.sizeToFit()
    }
}
