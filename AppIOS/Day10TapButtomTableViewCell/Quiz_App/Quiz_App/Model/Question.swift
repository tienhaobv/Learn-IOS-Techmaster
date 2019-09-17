//
//  Question.swift
//  Quiz_App
//
//  Created by Cuong  Pham on 9/9/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import Foundation
import SwiftyJSON

struct Question {
    var id : Int!
    var contentQuestion : String!
    var contentAnswerOne : String!
    var contentAnswerTwo : String!
    var contentAnswerThree : String!
    var contentAnswerFour : String!
    var rightAnswer : String!
    
    init(json : JSON) {
        self.id = json["id"].intValue
        self.contentQuestion = json["content_question"].stringValue
        self.contentAnswerOne = json["answer"][0]["content_answer"].stringValue
        self.contentAnswerTwo = json["answer"][1]["content_answer"].stringValue
        self.contentAnswerThree = json["answer"][2]["content_answer"].stringValue
        self.contentAnswerFour = json["answer"][3]["content_answer"].stringValue
        self.rightAnswer = json["right_answer"].stringValue
    }
}
