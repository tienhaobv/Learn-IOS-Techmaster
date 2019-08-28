//
//  Data.swift
//  BTcollectionView
//
//  Created by Ba Thoc on 8/27/19.
//  Copyright © 2019 Ba Thoc. All rights reserved.
//

import Foundation
import UIKit

class DataHorizontal {
    var title: String
    var author: String
    var image: UIImage
    
    init(_title: String, _author: String, _image: String) {
        title = _title
        author = _author
        image = UIImage(named: _image)!
    }
}

class DataVertical {
    var title: String
    var image: UIImage
    var numberNotification: Int
    
    init(_title: String, _image: String, _numberNotification: Int) {
        title = _title
        image = UIImage(named: _image)!
        numberNotification = _numberNotification
    }
}
