//
//  BestSale.swift
//  ZaloClone
//
//  Created by Cuong  Pham on 8/29/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import Foundation
import UIKit

class BestSale {
    var name : String!
    var image : UIImage!
    var sale : String!
    var price : String!
    
    init(_name : String, _image : UIImage, _sale : String, _price : String!) {
        self.name = _name
        self.image = _image
        self.sale = _sale
        self.price = _price
    }
}
