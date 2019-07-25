//
//  ViewController.swift
//  MemoryGame_Final
//
//  Created by Cuong  Pham on 7/2/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation

class ViewController: UIViewController, CardDelegate {
    
    
    var timeLabel : UILabel = UILabel()
    var countLabel : UILabel = UILabel()
    var nameLabel : UILabel = UILabel()
    
    var winImage : UIImageView = UIImageView()
    var loseImage : UIImageView = UIImageView()
    
    var gameLevel : Level!
    
    var row : Int = 3
    var col : Int = 2
    
    //var player : AVAudioPlayer!
    var board = Board()
    let margin: CGFloat = 12
    var timer : Timer!
    var timeOut : Int!
    
    var previousOpenCard: Card? = nil
    
    var point: Int = 0 //Khi point bằng tổng số tile thì người chơi thắng
    var flipCount: Int = 0 //Số lần người chơi đã lật tile kể cả lần thành công hoặc thất bại
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2509803922, green: 0.8274509804, blue: 0.6117647059, alpha: 1)
        setUpBoard(rows: row, cols: col)
        setUpTimeLabel()
        setUpCountLabel()
        setUpNameLabel()
        setUpWinImage()
        setUPLoseImage()
        run()
    }
    
    func run(){
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.runTimer), userInfo: nil, repeats: true)
    }
    
    func setUpBoard(rows : Int, cols : Int){
        board = Board.init(rows: rows, cols: cols)
        board.cardDelegate = self
        view.addSubview(board)
        board.translatesAutoresizingMaskIntoConstraints = false
        board.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIDevice.setSixe(iPhone: 10, iPad: 20)).isActive = true
        board.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: UIDevice.setSixe(iPhone: -10, iPad: -20)).isActive = true
        board.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 5/6).isActive = true
        board.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: UIDevice.setSixe(iPhone: -20, iPad: -40)).isActive = true
        board.backgroundColor = #colorLiteral(red: 0.2514770329, green: 0.8283686638, blue: 0.6131588817, alpha: 1)
    }
    
    func setUpTimeLabel(){
        timeLabel = UILabel.init(parrentView: view, text: "0:00")
        timeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: UIDevice.setSixe(iPhone: 20, iPad: 40)).isActive = true
    }
    
    func setUpCountLabel(){
        countLabel = UILabel.init(parrentView: view, text: "0")
        countLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: UIDevice.setSixe(iPhone: -20, iPad: -40)).isActive = true
    }
    
    func setUpNameLabel(){
        //mặc định sẽ để ẩn đi, khi nào lật đúng sẽ show ra tên của lá cờ đó
        nameLabel = UILabel.init(parrentView: view, text: "Test")
        nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameLabel.textColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        nameLabel.font = .boldSystemFont(ofSize: UIDevice.setSixe(iPhone: 22, iPad: 44))
        nameLabel.isHidden = true
    }
    
    func setUpWinImage(){
        winImage = UIImageView.init(parrentView: view, name: "win", top_constant: UIDevice.setSixe(iPhone: 50, iPad: 100))
        winImage.isHidden = true
    }
    
    func setUPLoseImage(){
        loseImage = UIImageView.init(parrentView: view, name: "over", top_constant: UIDevice.setSixe(iPhone: 50, iPad: 100))
        loseImage.isHidden = true
    }
    
    @objc func runTimer(){
        timeOut -= 1
        timeLabel.text = "\(stringFromTimeInterval(interval: TimeInterval(timeOut)))"
        if timeOut <= 0{
            timer?.invalidate()
            timeLabel.textColor = .red
            endGame(image: loseImage)
            HomeScreen.playSound(name: "lose")
        }
    }
    
    func endGame(image : UIImageView){
        image.isHidden = false
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTap))
        image.addGestureRecognizer(tapGestureRecognizer)
        board.alpha = 0.5
    }

    override func viewDidAppear(_ animated: Bool) {
        //với mỗi level và mức độ khác nhau sẽ khởi tạo các bảng với số hàng, số cột và giá trị khoảng random cũng cũng khác nhau
        if gameLevel == Level.easy{
            self.board.constructBoard(size: self.board.bounds.size, n2: Level.easy.description())
        }else if gameLevel == Level.hard{
            self.board.constructBoard(size: self.board.bounds.size, n2: Level.hard.description())
        }else{
            self.board.constructBoard(size: self.board.bounds.size, n2: Level.medium.description())
        }
    }
    
    func startNewGame() {
        point = 0
        flipCount = 0
    }
    
    func onCardFlip(card : Card) {
        print("Value: \(card.value)")
        HomeScreen.playSound(name: "tic")
        if flipCount == 0 {
            startNewGame()
        }
        
        flipCount += 1
        countLabel.text = String(flipCount)
        if previousOpenCard == nil {
            //Bắt đầu lật mới một title
            previousOpenCard = card
        } else {
            if previousOpenCard?.value != card.value { //Hai tile không giống nhau
                previousOpenCard?.close()
                card.close()
                HomeScreen.playSound(name: "fail")
            }else {
                //Hai tile giống nhau, cộng 2 điểm cho người chơi.
                point += 2
                print(point)
                //previousOpenCard?.isHidden = true
                //card.isHidden = true
                voiceNationFlag(name: Card.name[card.value - 1])    //phát tên của lá cờ được lật
                nameLabel.text = Card.name[card.value - 1]          //hiện tên lá cờ sau đó 1,5 giây thì ẩn đi
                nameLabel.isHidden = false
//                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
//                    self.nameLabel.isHidden = true
//                }
                //vì mỗi lần lật đúng được cộng 2 điểm nên khi điểm = hàng * cột thì thắng
                if point == board.rows * board.cols {
                    onPlayerWin()
                }
            }
            previousOpenCard = nil
        }
    }
    
    func onPlayerWin() {
        endGame(image: winImage)
        HomeScreen.playSound(name: "win")
        timer.invalidate()
    }
    
    @objc func imageTap(){
        let nextVC = MapViewController()
        self.present(nextVC, animated:  true, completion: nil)
    }

    //chuyển giây sang điinhj dạng mm:ss
    func stringFromTimeInterval(interval: TimeInterval) -> String {
        let interval = Int(interval)
        let seconds = (interval ) % 60
        let minutes = (interval / 60)
        return String(format: "%0d:%02d", minutes, seconds)
    }
    
    //text to speech
    func voiceNationFlag(name : String){
        let utterance = AVSpeechUtterance(string: name)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.35
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
}

