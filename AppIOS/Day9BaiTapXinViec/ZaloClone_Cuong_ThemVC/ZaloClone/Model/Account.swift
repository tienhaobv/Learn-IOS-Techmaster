//
//  Account.swift
//  ZaloClone
//
//  Created by Cuong  Pham on 8/30/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import Foundation
import UIKit

class Account {
    var avatar : UIImage!
    var name : String!
    var info : String!
    
    init(_avatar : UIImage, _name : String, _info : String) {
        self.avatar = _avatar
        self.name = _name
        self.info = _info
    }
}
