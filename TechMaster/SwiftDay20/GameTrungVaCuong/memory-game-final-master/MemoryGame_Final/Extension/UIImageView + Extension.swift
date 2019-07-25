//
//  UIImageView + Extension.swift
//  MemoryGame_Final
//
//  Created by Cuong  Pham on 7/12/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import Foundation
import UIKit
extension UIImageView{
    convenience init(parrentView : UIView, name : String, top_constant : CGFloat){
        self.init()
        parrentView.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.image = UIImage(named: name)
        self.centerXAnchor.constraint(equalTo: parrentView.centerXAnchor).isActive = true
        self.widthAnchor.constraint(equalTo: parrentView.widthAnchor).isActive = true
        self.heightAnchor.constraint(equalTo: parrentView.heightAnchor, multiplier: 2/5).isActive = true
        self.topAnchor.constraint(equalTo: parrentView.safeAreaLayoutGuide.topAnchor, constant: top_constant).isActive = true
        self.isUserInteractionEnabled = true
    }
}
