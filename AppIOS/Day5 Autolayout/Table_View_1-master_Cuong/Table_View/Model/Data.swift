//
//  Data.swift
//  Table_View
//
//  Created by Cuong  Pham on 8/20/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import Foundation
import UIKit

class Friends {
    var name : String!
    var imageName : String!
    var image : UIImage!
    var rating : Int!
    
    init(name : String, imageName : String, image : UIImage, rating : Int) {
        self.name = name
        self.imageName = imageName
        self.image = image
        self.rating = rating
    }
}
