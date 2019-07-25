//
//  TileDelegate.swift
//  MemoryGame_Final
//
//  Created by Cuong  Pham on 7/2/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import Foundation
//taọ delegate cho class
protocol CardDelegate : class {
    func onCardFlip (card: Card)
}
