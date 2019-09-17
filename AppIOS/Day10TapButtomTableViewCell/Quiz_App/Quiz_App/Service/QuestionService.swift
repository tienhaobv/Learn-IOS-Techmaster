//
//  QuestionService.swift
//  Quiz_App
//
//  Created by Cuong  Pham on 9/9/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol QuestionServiceDelegate : class {
    func loadQuestionSuccess(data :[Question])
    func loadQuestionFail(error : Error)
}

class QuestionService {
    var questionArray : Array<Question> = []
    
    weak var delegate : QuestionServiceDelegate?
    
    func loadQuestionData(){
        Alamofire.request("http://cuongpham2.atwebpages.com/list_question.php",
                          method: .get,
                          parameters: nil,
                          encoding: URLEncoding.default,
                          headers: nil).responseJSON { (response) in
                            switch response.result {
                            case .failure(let error):
                                self.delegate?.loadQuestionFail(error: error)
                            case .success(let value):
                                let _json = JSON(value)
                                let questionJSON = _json["questions"].arrayValue
                                for json in questionJSON{
                                    let questionObj = Question(json: json)
                                    self.questionArray.append(questionObj)
                                    self.delegate?.loadQuestionSuccess(data: self.questionArray)
                                }
                            }
        }
    }
}
