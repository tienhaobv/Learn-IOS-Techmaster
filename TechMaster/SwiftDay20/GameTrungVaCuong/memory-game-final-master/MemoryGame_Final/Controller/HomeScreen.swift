//
//  HomeScreen.swift
//  MemoryGame_Final
//
//  Created by Cuong  Pham on 7/2/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import UIKit
import AVFoundation

enum Level {
    case easy, medium, hard
    //mỗi mức độ sẽ random trong các khoảng khác nhau, dễ là [1;7], trung bình là [1;14], khó là [1;21]
    func description() -> Int{
        switch self {
        case .easy:
           return 7
        case .medium:
            return 14
        case .hard:
            return 22
        }
    }
}

class HomeScreen: UIViewController {

    var easyButton : UIButton = UIButton()
    var hardButton : UIButton = UIButton()
    var mediumButton : UIButton = UIButton()
    
    var headerImage : UIImageView = UIImageView()
    static var player : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2509803922, green: 0.8274509804, blue: 0.6117647059, alpha: 1)
        setUpHeaderImage()
        
        //khi tap vào mỗi button sẽ truyền biến level sang MapViewCOntroller
        easyButton = UIButton.init(parrentView: view, name: "Dễ", topEqual: headerImage.bottomAnchor)
        easyButton.addTarget(self, action: #selector(easy_tap), for: .touchUpInside)
        
        mediumButton = UIButton.init(parrentView: view, name: "Trung bình", topEqual: easyButton.bottomAnchor)
        mediumButton.addTarget(self, action: #selector(medium_tap), for: .touchUpInside)
        
        hardButton = UIButton.init(parrentView: view, name: "Khó", topEqual: mediumButton.bottomAnchor)
        hardButton.addTarget(self, action: #selector(hard_tap), for: .touchUpInside)
    }
    
    static func playSound(name : String){
        
        let path : String = Bundle.main.path(forResource: name, ofType: ".mp3")!
        let url : URL = URL(fileURLWithPath: path)
        do{
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        }catch{
            print("loi")
        }
    }
    
    @objc func easy_tap(){
        HomeScreen.playSound(name: "tic")
        let nextVC = MapViewController()
        MapViewController.game = .easy
        self.present(nextVC, animated: true, completion: nil)
    }
    
    @objc func medium_tap(){
        HomeScreen.playSound(name: "tic")
        let nextVC = MapViewController()
        MapViewController.game = .medium
        self.present(nextVC, animated: true, completion: nil)
    }
    
    @objc func hard_tap(){
        HomeScreen.playSound(name: "tic")
        let nextVC = MapViewController()
        MapViewController.game = .hard
        self.present(nextVC, animated: true, completion: nil)
    }
    
    func setUpHeaderImage(){
        headerImage = UIImageView.init(parrentView: view, name: "header", top_constant: UIDevice.setSixe(iPhone: 20, iPad: 40))
        headerImage.contentMode = .scaleAspectFit
    }
}
