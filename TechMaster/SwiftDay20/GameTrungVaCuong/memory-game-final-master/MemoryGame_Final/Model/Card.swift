//
//  Tile.swift
//  MemoryGame_Final
//
//  Created by Cuong  Pham on 7/2/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import UIKit
import Foundation

class Card: UIView {
    var value: Int = -1
    var frontView: UIView?
    var backView: UIView?
    //mảng lưu tên của các lá cờ để phát thành tiếng
    static var name : [String] = ["England", "Brazil", "China", "Vietnam", "Korea", "Germany", "Japan",
                                  "Italy", "France", "Belgium", "Mexico", "Norway", "Thailand", "Argentina",
                                  "Australia", "Russia", "Spain", "Cambodia", "Portugal", "Sweden", "Denmark","cuong"]
    var delegate: CardDelegate?
    
    private var isFlipped: Bool = false
    
    init(value: Int, frame: CGRect, front: UIImageView, back: UIImageView, delegate: CardDelegate) {
        super.init(frame: frame)

        self.value = value
        
        self.delegate = delegate
        
        frontView = front
        backView = back
        
        frontView!.frame = self.bounds
        backView!.frame = self.bounds
        self.addSubview(backView!)
        self.addSubview(frontView!)
        
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(flip)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func flip() {
        if isFlipped == false{
            let cardToFlip = frontView
            let bottomCard = backView

            UIView.transition(from: cardToFlip!,
                              to: bottomCard!,
                              duration: 0.5,
                              options: [.transitionFlipFromLeft, .showHideTransitionViews],
                              completion: { (_) in
                                if self.isFlipped == true {
                                    self.delegate?.onCardFlip(card: self)
                                }
            })
            isFlipped = true
        }
    }
    
    func close() {
        if !isFlipped {
            return
        }
        
        isFlipped = false
        UIView.transition(from: backView!,
                          to: frontView!,
                          duration: 0.5,
                          options: [.transitionFlipFromLeft, .showHideTransitionViews],
                          
                          completion: nil)
    }
}


