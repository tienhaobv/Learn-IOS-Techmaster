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
    
    var col: Int = 3
    var row: Int = 4
    let myQuantyImage: Int = 4
    let margin: CGFloat = 10
    let imgBg : UIView = UIImageView(image: UIImage(named: "gate-garden-greenary-artwork"))
//    var arCards = [[CardsImageView]]()
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
    static var arTempCards = Array(repeating: CardsImageView(1, size: CGSize(width: 0.0, height: 0.0)).self, count: 12)
//    var newIamge: CardsImageView = CardsImageView(1)
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        view.addSubview(imgBg)
        imgBg.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
//        newIamge.frame = CGRect(x: 0, y: 100, width: 100, height: 125)
//        view.addSubview(newIamge)
        createCards()
//        self.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(tab))
        self.view.addGestureRecognizer(tap)
        
    }
    
    @objc func tab(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
            ViewController.playSound(name: "touch", type: "wav")
        }
    }
    
    func createCards() {
        let check: Int = col*row
        // hàng và cột ít nhất phải lớn hơn hoặc bằng 2
        if check != 0 && check % 2 == 0
        {
            
            let cardWidth = (view.bounds.width - CGFloat(col + 1) * margin) / CGFloat(col)
            let cardHeight = (view.bounds.height - 60 - CGFloat(row + 1) * margin) / CGFloat(row)
            // tạo mảng tạm để random không chùng vị trí
            var arTemp : [Int] = Array(0..<check)
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
            var n: Int = 0
            for i in 0..<row {
//                var subCards = [CardsImageView]()
                for j in 0..<col {
                    ViewController.arTempCards[n].frame = CGRect(x: margin * CGFloat(j + 1) + cardWidth * CGFloat(j),
                                                y: 40.0 + margin * CGFloat(i + 1) + cardHeight * CGFloat(i),
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
            print("1")
            if isEat {
                arTempCards[IDofit].removeFromSuperview()
                arTempCards[IDofme].removeFromSuperview()
                count += 1
            }
            else {
                arTempCards[IDofit].flip2()
                arTempCards[IDofme].flip2()
            }
            // reset biến
            IDofme = -1
            IDofit = -1
            saveID = -1
            check = -1
            isEat = false
        }
        // số cặp ăn được bằng nửa số mảng là thắng
        if count == arTempCards.count/2 {
            playSound(name: "youwin_g3", type: "m4a")
        }
    }
    
    public static func playSound(name: String, type: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: type) else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
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
            /* iOS 10 and earlier require the following line:
             player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */
            
            guard let player = player else { return }
            
            player.play()
            
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

