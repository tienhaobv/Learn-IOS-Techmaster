//
//  ViewController.swift
//  CardGame
//
//  Created by Taof on 6/22/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var buttons: [UIButton]!
    
    lazy var game = MemoryGame(numberOfPairsOfCards: (buttons.count + 1) / 2)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func touch(_ sender: Any) {
//        flipCount += 1
        
        if let indexOfButton = buttons.firstIndex(of: sender as! UIButton) {
            game.chooseCard(at: indexOfButton)
            updateUIFromModel()
        } else {
            print("card was not in the cardButtons collection")
        }
    }
    
    func updateUIFromModel() {
        for i in buttons.indices {
            let button = buttons[i] // view
            let card = game.cards[i] // model
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojis:[String] = ["🐹", "🐰", "🦊", "🐼", "🐻", "🐶", "🐵"]
    var emojiMap = [Int: String]() //Dictionary<Int, String>()
    
    func emoji(for card: Card) -> String {
        if emojiMap[card.identifier] == nil, emojis.count > 0 {
            // set the emoji for the identifier
            let randomInt: Int = Int(arc4random_uniform(UInt32(emojis.count)))
            emojiMap[card.identifier] = emojis.remove(at: randomInt)
        }
        return emojiMap[card.identifier] ?? "?"
    }
    
    
}

