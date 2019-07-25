//
//  MapViewController.swift
//  MemoryGame_Final
//
//  Created by Cuong  Pham on 7/11/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//
//mỗi mức độ khó-dễ sẽ chia ra các level nhỏ hơn, mỗi level sẽ có số hàng, số cột và thời gian chơi khác nhau
import UIKit
import Foundation

enum Map{
    case one, two, three
    func description() -> [Int]{
        var row_col_time = [Int]()
        switch self {
        case .one:
            if MapViewController.game == .easy {
                row_col_time = [3,2,24]    // [row,col]
            }else if MapViewController.game == .medium {
                row_col_time = [4,4,64]
            }else{
                row_col_time = [6,4,96]
            }
        case .two:
            if MapViewController.game == .easy {
                row_col_time = [4,3,48]
            }else if MapViewController.game == .medium {
                row_col_time = [6,4,96]
            }else{
                row_col_time = [8,4,128]
            }
        case .three:
            if MapViewController.game == .easy {
                row_col_time = [6,4,96]
            }else if MapViewController.game == .medium {
                row_col_time = [8,4,128]
            }else{
                row_col_time = [14,4,224]
            }
        }
        return row_col_time
    }
}

class MapViewController: UIViewController {

    static var game : Level!
    
    var oneButton : UIButton = UIButton()
    var twoButton : UIButton = UIButton()
    var threeButton : UIButton = UIButton()
    var toplabel : UILabel = UILabel()
    var backButton : UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2514770329, green: 0.8283686638, blue: 0.6131588817, alpha: 1)
        print(MapViewController.game!)
        setUpOneButton()
        setUpTwoButton()
        setUpThreeButton()
        setUpTopLabel()
        setUpBackButton()
    }
    
    func setUpOneButton(){
        oneButton = UIButton.init(parrentView: view, nameImage: "one", topEqual: view.safeAreaLayoutGuide.topAnchor)
        oneButton.addTarget(self, action: #selector(oneTap), for: .touchUpInside)
    }
    
    func setUpTwoButton(){
        twoButton = UIButton.init(parrentView: view, nameImage: "two", topEqual: oneButton.bottomAnchor)
        twoButton.addTarget(self, action: #selector(twoTap), for: .touchUpInside)
    }
    
    func setUpThreeButton(){
        threeButton = UIButton.init(parrentView: view, nameImage: "three", topEqual: twoButton.bottomAnchor)
        threeButton.addTarget(self, action: #selector(threeTap), for: .touchUpInside)

    }
    
    //khi tap vào các button sẽ truyền biến hàng, cột, thời gian chơi sang VIewController
    
    @objc func oneTap(){
        HomeScreen.playSound(name: "tic")
        let nextVC = ViewController()
        nextVC.col = Map.one.description()[1]
        nextVC.row = Map.one.description()[0]
        nextVC.timeOut = Map.one.description()[2]
        nextVC.gameLevel = MapViewController.game
        self.present(nextVC, animated: true, completion: nil)
    }
    
    @objc func twoTap(){
        HomeScreen.playSound(name: "tic")
        let nextVC = ViewController()
        nextVC.col = Map.two.description()[1]
        nextVC.row = Map.two.description()[0]
        nextVC.timeOut = Map.two.description()[2]
        nextVC.gameLevel = MapViewController.game
        self.present(nextVC, animated: true, completion: nil)
    }
    
    @objc func threeTap(){
        HomeScreen.playSound(name: "tic")
        let nextVC = ViewController()
        nextVC.col = Map.three.description()[1]
        nextVC.row = Map.three.description()[0]
        nextVC.gameLevel = MapViewController.game
        nextVC.timeOut = Map.three.description()[2]
        
        self.present(nextVC, animated: true, completion: nil)
    }
    
    func setUpTopLabel(){
        toplabel = UILabel.init(parrentView: view, text: "Level")
        toplabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        toplabel.textColor = .black
    }
    
    //back lại màn hình ban đầu
    func setUpBackButton(){
        view.addSubview(backButton)
        backButton.translatesAutoresizingMaskIntoConstraints = false
        backButton.setBackgroundImage(UIImage(named: "back"), for: .normal)
        backButton.widthAnchor.constraint(equalToConstant: UIDevice.setSixe(iPhone: 30, iPad: 60)).isActive = true
        backButton.heightAnchor.constraint(equalToConstant: UIDevice.setSixe(iPhone: 30, iPad: 60)).isActive = true
        backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        backButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: UIDevice.setSixe(iPhone: 10, iPad: 20)).isActive = true
        backButton.addTarget(self, action: #selector(backToHome), for: .touchUpInside)
    }
    
    @objc func backToHome(){
        let nextVC = HomeScreen()
        self.present(nextVC, animated:  true, completion: nil)
    }
}
