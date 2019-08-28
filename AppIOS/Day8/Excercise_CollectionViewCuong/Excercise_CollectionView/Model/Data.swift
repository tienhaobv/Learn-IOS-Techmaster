//
//  Data.swift
//  Excercise_CollectionView
//
//  Created by Cuong  Pham on 8/26/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import Foundation
import UIKit

class Data_1 {
    private var _title : String!
    private var _author : String!
    private var _image : UIImage!
    
    var title : String { return _title }
    var author : String { return _author }
    var image : UIImage { return _image }
    
    init(title : String, author : String ,image : UIImage ){
        self._title = title
        self._image = image
        self._author = author
    }
}

class Data_2 {
    private var _name : String!
    private var _image : UIImage!
    private var _number : UIImage!
    private var _featured : UIImage!
    
    var name : String { return _name }
    var image : UIImage { return _image }
    var number : UIImage { return _number }
    var featured : UIImage { return _featured }
    
    init(name : String, image : UIImage, number : UIImage, featured : UIImage) {
        self._name = name
        self._image = image
        self._number = number
        self._featured = featured
    }
}
