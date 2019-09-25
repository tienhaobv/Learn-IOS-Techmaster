//
//  UserService.swift
//  login_with_server
//
//  Created by Cuong  Pham on 9/17/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol UserServiceDelegate : class {
    func loadUserSuccess(data : [User])
    func loadUserFail(error : Error)
}

class UserService {
    private var userArray : Array<User> = []
    
    weak var delegate : UserServiceDelegate?
    
    func loadUser(){
        Alamofire.request("http://localhost/demo_server/get_all_user.php",
                          method: .get,
                          parameters: nil,
                          encoding: URLEncoding.default,
                          headers: nil).responseJSON { (response) in
                            switch response.result{
                            case .failure(let error):
                                self.delegate?.loadUserFail(error: error)
                            case .success(let value):
                                let _json = JSON(value)
                                let userJSON = _json["user"].arrayValue
                                for json in userJSON{
                                    let userObj = User(json: json)
                                    self.userArray.append(userObj)
                                }
                                self.delegate?.loadUserSuccess(data: self.userArray)
                            }
        }
    }
    
}
