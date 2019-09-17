//
//  MainScreen.swift
//  Quiz_App
//
//  Created by Cuong  Pham on 9/9/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import UIKit
import Stevia

class MainScreen: UIViewController {
    
    let questionService = QuestionService()
    fileprivate var dataArray = [Question]()
    
    static var acceptLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = UIColor.red
        label.sizeToFit()
        label.text = "Congratulation!"
        return label
    }()
    
    var collectionView : UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout.init())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpCollectionView()
        setUpLabel()
        
        questionService.delegate = self
        questionService.loadQuestionData()
    }
    
    fileprivate func setUpCollectionView(){
        view.sv(collectionView)
        collectionView.width(100%).height(50%).centerInContainer()
        collectionView.backgroundColor = .cyan
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.scrollDirection = .horizontal
        }
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.bounces = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(QuestionCell.self, forCellWithReuseIdentifier: "Question")
    }
    
    fileprivate func setUpLabel(){
        view.sv(MainScreen.acceptLabel)
        MainScreen.acceptLabel.centerHorizontally().Top == collectionView.Bottom + 10
        MainScreen.acceptLabel.isHidden = true
    }
}

extension MainScreen : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: "Question", for: indexPath) as? QuestionCell else {
            fatalError("fail")
        }
        item._data = [dataArray[indexPath.row].contentAnswerOne,
                      dataArray[indexPath.row].contentAnswerTwo,
                      dataArray[indexPath.row].contentAnswerThree,
                      dataArray[indexPath.row].contentAnswerFour
        ]
        
        item._right = dataArray[indexPath.row].rightAnswer
        
        item.contentQuestionLabel.text = dataArray[indexPath.row].contentQuestion
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}

extension MainScreen : QuestionServiceDelegate {
    func loadQuestionSuccess(data: [Question]) {
        self.dataArray = data
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func loadQuestionFail(error: Error) {
        print(error)
    }
    
    
}
