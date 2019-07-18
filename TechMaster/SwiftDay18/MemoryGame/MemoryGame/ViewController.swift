//
//  ViewController.swift
//  MemoryGame
//
//  Created by Ba Thoc on 6/22/19.
//  Copyright © 2019 Ba Thoc. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    var col2: Int?
    var row2: Int?
    let myQuantyImage: Int = 4
    let margin: CGFloat = 10
    let imgBg : UIView = UIImageView(image: UIImage(named: "BGingamenew-2"))
    var bar : UIView = UIImageView(image: UIImage(named: "time"))
    var barMark : UIView = UIImageView(image: UIImage(named: "markTime"))
    var barMark2 : UIView = UIImageView(image: UIImage(named: "markTime2"))
    var timeCountDown : CGFloat = 0.0
    
    //    var arCards = [[CardsImageView]]()
    static var playerBg: AVAudioPlayer?
    static var col: Int = 3
    static var row: Int = 4
    static var timer = Timer()
    static var youlost : UIView = UIImageView(image: UIImage(named: "popLost"))
    static var youwin : UIView = UIImageView(image: UIImage(named: "popWin"))
    static var reset : UIView = UIImageView(image: UIImage(named: "replay"))
    static var player2: AVAudioPlayer?
    static var player: AVAudioPlayer?
    static var count: Int = 0
    static var check : Int = -1
    static var saveID : Int = -1
    static var IDofit = -1
    static var IDofme = -1
    static var isEat : Bool = false
    // mảng tạm lưu arcards rồi ínter lại vào mảng chính
    //            var arTempCards = [CardsImageView]()
    // mảng các lá bài tạo ra ở trạng thái có sẵn phần tử
    static var arTempCards = Array(repeating: CardsImageView(1, size: CGSize(width: 0.0, height: 0.0)).self, count: 20)
    //    var newIamge: CardsImageView = CardsImageView(1)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        
//        print(row2)
//        print(col2)
//        row = row2!
//        col = col2!
        
        view.addSubview(imgBg)
        imgBg.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        //        newIamge.frame = CGRect(x: 0, y: 100, width: 100, height: 125)
        //        view.addSubview(newIamge)
        createCards()
        ViewController.playSoundBg()
        barMark.frame = CGRect(x: 10, y: 50, width: view.frame.width - 20, height: 40)
        view.addSubview(barMark)
        bar.frame = CGRect(x: 3, y: 5, width: view.frame.width - 32, height: 30)
//        bar.backgroundColor = .green
        barMark.addSubview(bar)
        timeCountDown = (bar.frame.width/30)/10
        barMark2.frame = CGRect(x: 5, y: 50, width: 40, height: 40)
        view.addSubview(barMark2)
        ViewController.timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(countdown), userInfo: nil, repeats: true)
//        self.isUserInteractionEnabled = true
        ViewController.reset.frame = CGRect(x: view.frame.width/2 - 40, y: (view.frame.height/2) + 40, width: 80, height: 80)
        view.addSubview(ViewController.reset)
        ViewController.reset.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tab))
        ViewController.reset.addGestureRecognizer(tap)
        ViewController.reset.isHidden = true
        ViewController.youwin.frame = CGRect(x: view.frame.width/2 - 200, y: (view.frame.height/2) - 40, width: 400, height: 70)
        view.addSubview(ViewController.youwin)
        ViewController.youwin.isHidden = true
        ViewController.youlost.frame = CGRect(x: view.frame.width/2 - 200, y: (view.frame.height/2) - 40, width: 400, height: 70)
        view.addSubview(ViewController.youlost)
        ViewController.youlost.isHidden = true
        
    }
    
    @objc func countdown() {
        if bar.frame.size.width >= timeCountDown*10 {
            bar.frame.size.width = bar.frame.size.width - timeCountDown
        }
        else {
            ViewController.timer.invalidate()
            print("TimeDone")
            ViewController.playSound(name: "t_thuacuoc_hc", type: "m4a")
            ViewController.youlost.isHidden = false
            ViewController.reset.isHidden = false
            CardsImageView.gameover = true
            ViewController.stopSoundBg()
        }
    }
    
    @objc func tab(){
        print("tab")
        ViewController.playSound(name: "touch", type: "wav")
        CardsImageView.gameover = false
        ViewController.count = 0
        self.performSegue(withIdentifier: "goback", sender: self)
//        if ViewController.reset.isHidden == false {
//            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//                self.dismiss(animated: true, completion: nil)
//            }
//        }
    }
    
    func createCards() {
        let check: Int = ViewController.col*ViewController.row
        // hàng và cột ít nhất phải lớn hơn hoặc bằng 2
        if check != 0 && check % 2 == 0
        {
            
            let cardWidth = (view.bounds.width - CGFloat(ViewController.col + 1) * margin) / CGFloat(ViewController.col)
            let cardHeight = (view.bounds.height - 100 - CGFloat(ViewController.row + 1) * margin) / CGFloat(ViewController.row)
            // tạo mảng tạm để random không chùng vị trí
            var arTemp : [Int] = Array(0..<check)
            if check/myQuantyImage < 2 {
                for i in 0..<check/2 {
                    for _ in 0..<2 {
                        // random lấy số ở mảng tạm
                        let index : Int = Int.random(in: 0..<arTemp.count)
                        // tạo ra một thằng ca
                        let _newImage: CardsImageView = CardsImageView(i, size: CGSize(width: cardWidth, height: cardHeight))
                        _newImage.ID = arTemp[index]
                        //                    arTempCards.append(_newImage)
                        // thay thế thằng đang chứa trong mảng bằng thằng mới
                        ViewController.arTempCards[arTemp[index]] = _newImage
                        // xoá index vừa random được ở mảng tạm
                        arTemp.remove(at: index)
                    }
                }
            }
            else {
                // for từ 0 tới số lượng ảnh mình đang có (hiện tại đang có 4 ảnh) để đản bảo sự công bằng cho tất cả các ảnh
                for i in 0..<myQuantyImage {
                    // số lần 1 ảnh được xuất hiện bằng tổng số ảnh cần hiện chia co số ảnh hiện có
                    // nếu chẵn ảnh sinh bt
                    if (check/myQuantyImage)%2 == 0 {
                        for _ in 0..<check/myQuantyImage {
                            // random lấy số ở mảng tạm
                            let index : Int = Int.random(in: 0..<arTemp.count)
                            // tạo ra một thằng ca
                            let _newImage: CardsImageView = CardsImageView(i, size: CGSize(width: cardWidth, height: cardHeight))
                            _newImage.ID = arTemp[index]
                            //                    arTempCards.append(_newImage)
                            // thay thế thằng đang chứa trong mảng bằng thằng mới
                            ViewController.arTempCards[arTemp[index]] = _newImage
                            // xoá index vừa random được ở mảng tạm
                            arTemp.remove(at: index)
                        }
                    }
                        // nếu ảnh bị lẻ
                    else {
                        // in là chẵn số ảnh
                        for _ in 0..<(check/myQuantyImage) - 1 {
                            // random lấy số ở mảng tạm
                            let index : Int = Int.random(in: 0..<arTemp.count)
                            // tạo ra một thằng card
                            let _newImage: CardsImageView = CardsImageView(i, size: CGSize(width: cardWidth, height: cardHeight))
                            _newImage.ID = arTemp[index]
                            //                    arTempCards.append(_newImage)
                            // thay thế thằng đang chứa trong mảng bằng thằng mới
                            ViewController.arTempCards[arTemp[index]] = _newImage
                            // xoá index vừa random được ở mảng tạm
                            arTemp.remove(at: index)
                        }
                    }
                }
                // nếu bị lẻ ảnh thì sinh ra nốt 2 cặp còn lại
                if (check/myQuantyImage)%2 != 0 {
                    for _ in 0...1{
                        let typeImage = Int.random(in: 0...3)
                        let index : Int = Int.random(in: 0..<arTemp.count)
                        let _newImage: CardsImageView = CardsImageView(typeImage, size: CGSize(width: cardWidth, height: cardHeight))
                        _newImage.ID = arTemp[index]
                        ViewController.arTempCards[arTemp[index]] = _newImage
                        arTemp.remove(at: index)
                        let index2 : Int = Int.random(in: 0..<arTemp.count)
                        let _newImage2: CardsImageView = CardsImageView(typeImage, size: CGSize(width: cardWidth, height: cardHeight))
                        _newImage2.ID = arTemp[index2]
                        ViewController.arTempCards[arTemp[index2]] = _newImage2
                        arTemp.remove(at: index2)
                    }
                }
            }
            var n: Int = 0
            for i in 0..<ViewController.row {
                //                var subCards = [CardsImageView]()
                for j in 0..<ViewController.col {
                    ViewController.arTempCards[n].frame = CGRect(x: margin * CGFloat(j + 1) + cardWidth * CGFloat(j),
                                                                 y: 100.0 + margin * CGFloat(i + 1) + cardHeight * CGFloat(i),
                                                                 width: cardWidth,
                                                                 height: cardHeight)
                    view.addSubview(ViewController.arTempCards[n])
                    //                    subCards.append(arTempCards[n])
                    //                    var flipView: FlipView?
                    //                    let cardView = UIImageView(image: UIImage(named: "Mark"))
                    //                    flipView = FlipView(size: CGSize(width: cardWidth, height: cardHeight), front: cardView, back: UIImageView(image: UIImage(named: arTempCards[n].imageSet[arTempCards[n].type])))
                    //                    flipView!.frame = CGRect(x: margin * CGFloat(j + 1) + CGFloat(j) * cardWidth,
                    //                                             y: 44 + CGFloat(i) * (cardHeight + margin),
                    //                                             width: cardWidth,
                    //                                             height: cardHeight)
                    //                    view.addSubview(flipView!)
                    n+=1
                }
                //                arCards.append(subCards)
            }
        }
        
        
    }
    public static func checkEat() {
        if IDofit != -1 {
            if isEat {
                playSound2(name: "auTrue", type: "m4a")
                arTempCards[IDofit].removeFromSuperview()
                arTempCards[IDofme].removeFromSuperview()
                count += 1
                print("1")
            }
            else {
                playSound2(name: "auFalse", type: "m4a")
                arTempCards[IDofit].flip2()
                arTempCards[IDofme].flip2()
                print("2")
            }
            // reset biến
            IDofme = -1
            IDofit = -1
            saveID = -1
            check = -1
            isEat = false
        }
        // số cặp ăn được bằng nửa số mảng là thắng
        if count == row*col/2 {
            playSound(name: "youwin_g3", type: "m4a")
            print("Game Win")
            reset.isHidden = false
            youwin.isHidden = false
            stopSoundBg()
            timer.invalidate()
        }
    }
    
    public static func playSound(name: String, type: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: type) else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            if type == "mp3" {
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            }
            else if type == "m4a" {
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.m4a.rawValue)
            }
            else if type == "wav" {
                player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            }
            else {
                print("errorAudio")
            }
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    static func playSound2(name: String, type: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: type) else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player2 = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.m4a.rawValue)
            
            guard let player = player2 else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    static func playSoundBg() {
        guard let url = Bundle.main.url(forResource: "music1", withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            playerBg = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            guard let player = playerBg else { return }
            
            player.play()
            player.numberOfLoops = -1
            player.volume = 0.3
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    static func stopSoundBg() {
        guard let url = Bundle.main.url(forResource: "music1", withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            playerBg = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            guard let player = playerBg else { return }
            
            player.stop()
            player.numberOfLoops = -1
            player.volume = 0.3
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    // check thắng cuộc
    
    //    func showImage(){
    //        let cardWidth = (view.bounds.width - CGFloat(col + 1) * margin) / CGFloat(col)
    //        let cardHeight : CGFloat = (view.bounds.height - 60 - CGFloat(row + 1) * margin) / CGFloat(row)
    //        //        print(view.bounds.height)
    //        //        print(cardHeight)
    //        for i in 0..<row{
    //            for j in 0..<col{
    //                let card = arCards[i]
    ////                let card = cards[key]
    //                let cardView = UIImageView(image: UIImage(named: "Mark"))
    //
    ////                flipView = FlipView(size: CGSize(width: cardWidth, height: cardHeight), front: cardView, back: UIImageView(image: card!))
    //                flipView!.frame = CGRect(x: margin * CGFloat(j + 1) + CGFloat(j) * cardWidth,
    //                                         y: 44 + CGFloat(i) * (cardHeight + margin),
    //                                         width: cardWidth,
    //                                         height: cardHeight)
    //                view.addSubview(flipView!)
    //
    //            }
    //
    //        }
    //    }
    
    
}

