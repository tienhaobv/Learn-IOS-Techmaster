//
//  ViewController.swift
//  CosmosRatingTutorial
//
//  Created by Taof on 3/28/19.
//  Copyright © 2019 Taof. All rights reserved.
//

import UIKit
import Cosmos
import TinyConstraints

class ViewController: UIViewController {
    
    lazy var cosmosView: CosmosView = {
       var view = CosmosView()
        
//        view.settings.updateOnTouch = false
        
        view.settings.filledImage = UIImage(named: "star-fill")?.withRenderingMode(.alwaysOriginal)
        view.settings.emptyImage = UIImage(named: "star-empty")?.withRenderingMode(.alwaysOriginal)
        
        view.settings.totalStars = 5
        view.settings.starSize = 50
        view.settings.starMargin = 1.0
        
//        view.settings.fillMode = .full
        view.settings.fillMode = .precise
        
//        view.text = "Rate me"
//        view.settings.textColor = .red
//        view.settings.textMargin = 10
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(cosmosView)
        cosmosView.centerInSuperview()
        print(cosmosView.rating)
        cosmosView.didTouchCosmos = { rating in
            print("Rating \(rating)")
        }
    }


}

