//
//  MemoryGame.swift
//  CardGame
//
//  Created by Taof on 6/22/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import Foundation

class MemoryGame {
    var cards:[Card] = [Card]()
    var indexOfOneAndOnlyCardFacedUp: Int?
    
    init(numberOfPairsOfCards: Int) {
        // make numberOfPairsOfCards cards
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        // Shuffle
        cards.shuffle()
    }
    
    func chooseCard(at index: Int) {
        if !cards[index].isMatched {
            if let flippedCardIndex = indexOfOneAndOnlyCardFacedUp, index != flippedCardIndex {
                if cards[index].identifier == cards[flippedCardIndex].identifier {
                    cards[index].isMatched = true
                    cards[flippedCardIndex].isMatched = true
                }
                indexOfOneAndOnlyCardFacedUp = nil
                cards[index].isFaceUp = true
            } else {
                // either no cards or 2 cards are face up
                for faceDown in cards.indices {
                    cards[faceDown].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyCardFacedUp = index
            }
        }
    }
}

extension Array {
    mutating func shuffle() {
        for _ in 0..<self.count {
            sort{(_, _) in arc4random() < arc4random()}
        }
    }
}
