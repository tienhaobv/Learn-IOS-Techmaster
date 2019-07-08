//
//  PlacementType.swift
//  GameWord
//
//  Created by Tung on 7/4/19.
//  Copyright © 2019 Tung. All rights reserved.
//

import Foundation
enum PlacementType : CaseIterable {
    case leftRight
    case rightLeft
    case upDown
    case downUp
    case topLeftBottomtight
    case topRightBottomLeft
    case bottomLeftTopRight
    case bottomRightTopLeft
    
    var movement: (x: Int, y: Int){
        switch self {
        case .leftRight:
            return(1, 0)
        case .rightLeft:
            return(-1, 0)
        case .upDown:
            return(0, 1)
        case .downUp:
            return(0, -1)
        case .topLeftBottomtight:
            return(1, 1)
        case .topRightBottomLeft:
            return(-1, 1)
        case .bottomLeftTopRight:
            return(1, -1)
        case .bottomRightTopLeft:
            return(-1,-1)
        
        }
    }
}

enum Difficulty {
    case easy
    case medium
    case hard
    
    var placementTypes: [PlacementType] {
        switch self {
        case .easy:
            return[.leftRight, .upDown].shuffled()
        case .medium:
            return[.leftRight, .rightLeft, .upDown, .downUp].shuffled()
        case .hard:
            return PlacementType.allCases.shuffled()
        }
    }
}

struct Word: Decodable {
    var text: String
    var clue: String
}

class WordSearch{
    var words = [Word]()
    var gridSize = 10
}
