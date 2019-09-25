//
//  User.swift
//  login_with_server
//
//  Created by Cuong  Pham on 9/17/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import Foundation
import SwiftyJSON

class User {
    var email : String!
    var password : String!
    var fullName : String!
    
    init(json : JSON){
        self.email = json["email"].stringValue
        self.password = json["password"].stringValue
        self.fullName = json["full_name"].stringValue
    }
    
     init(_email : String, _pass : String, _name : String){
       // self.init()
        self.email = _email
        self.password = _pass
        self.fullName = _name
    }
}
