//
//  Card.swift
//  CardGame
//
//  Created by Taof on 6/22/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation

struct Card {
    var isMatched = false
    var isFaceUp = false
    var identifier: Int
    
    static var identifierMaker = 0
    static func getUniqueIdentifier() -> Int {
        identifierMaker += 1
        return identifierMaker
    }
    
    init() {
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
