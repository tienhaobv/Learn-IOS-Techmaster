//
//  CardsImageView.swift
//  MemoryGame
//
//  Created by Ba Thoc on 6/22/19.
//  Copyright © 2019 Ba Thoc. All rights reserved.
//

import UIKit
import AVFoundation

class CardsImageView: UIView {

    var type: Int = 0
    var ID: Int = 0
    var isflip : Bool = false
    let imageSet = ["la-bai-1","la-bai-2","la-bai-3","la-bai-4"]
    let name = ["chicken","bird","snake","pig"]
    var lock : Bool = false
    let cardView = UIImageView(image: UIImage(named: "mark-1"))
    var frontView: UIView?
    var backView: UIView?
    private var isFlipped: Bool = true
    var flipStyleOption: UIView.AnimationOptions = .transitionFlipFromLeft
    static var gameover : Bool = false
    
    init(_ idImage: Int, size: CGSize) {
        super.init(frame: CGRect.zero)
//        self.image = UIImage(named: imageSet[idImage])
//        self.image = UIImage(named: "Mark")
        self.type = idImage
        
        frontView = cardView
        backView = UIImageView(image: UIImage(named: imageSet[idImage]))
//        xét hình scale bằng với cái view
//        backView?.contentMode = .scaleToFill
//        xoá bound bên ngoài của hình
//        backView?.clipsToBounds = true
        frontView?.frame = CGRect(origin: CGPoint.zero, size: size)
        backView?.frame = CGRect(origin: CGPoint.zero, size: size)
        
        
        addSubview(backView!)
        addSubview(frontView!)
        flip2()
//          Đây là code tab lật cũ
//        self.isUserInteractionEnabled = true
//        let tap = UITapGestureRecognizer(target: self, action: #selector(tabFun))
//        self.addGestureRecognizer(tap)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tabFun)))
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // kiểm tra xem có click cùng vào một lá không(nếu có úp lá đó lại)
    @objc func tabFun() {
        if CardsImageView.gameover == false {
            ViewController.playSound(name: "touch", type: "wav")
            if !lock {
                lock = true
                flip()
                
            }
            else {
                lock = false
                flip2()
            }
            print(lock)
        }
    }
    
    //hàm quay lá và check dữ liệu
    @objc func flip() {
        ViewController.playSound(name: "turnpage", type: "wav")
        print("this is tap index: ", type)
        isFlipped = !isFlipped
        
        let cardToFlip = isFlipped ? frontView : backView
        let bottomCard = isFlipped ? backView : frontView
        
        UIView.transition(from: cardToFlip!,
                          to: bottomCard!,
                          duration: 0.5,
                          options: [flipStyleOption, .showHideTransitionViews],
                          
                          completion: {_ in
                                //kiểm tra xem  là lá đầu tiên hay lá thứ 2 được click
                                if ViewController.check == -1 {
                                    // lưu giá trị id và kiểu của lá đầu tiên được click
                                    ViewController.check = self.type
                                    ViewController.saveID = self.ID
                                }
                                //nếu không phải lá đầu tiên được mở thì chạy hàm kiểm tra
                                else {
                                    // lưu giá trị ID của 2 lá bài
                                    ViewController.IDofit = ViewController.saveID
                                    ViewController.IDofme = self.ID
                                    // kiểm tra xem chúng giống type của nhau không
                                    if ViewController.check == self.type {
                                        ViewController.isEat = true
                                        ViewController.checkEat()
                                    }
                                    // nếu cúng khác kiểu nhau thì set isEat = false
                                    else {
                                        ViewController.isEat = false
                                        ViewController.checkEat()
                                    }
                                }
                                //text to speech
                                self.voiceFlag(name : self.name[self.type])
                            })
    }
    // hàm để quay úp lá bài và không check
    @objc func flip2() {
        //ViewController.playSound(name: "turnpage", type: "wav")
        isFlipped = !isFlipped
        
        let cardToFlip = isFlipped ? frontView : backView
        let bottomCard = isFlipped ? backView : frontView
        // đoạn ì này phải viết ở trên đặt dưới có thể sẽ lỗi(khi hàm soay chưa thực hiện xong tác vụ)
        if !lock {
            ViewController.IDofme = -1
            ViewController.IDofit = -1
            ViewController.saveID = -1
            ViewController.check = -1
            ViewController.isEat = false
        }
        // hàm này dùng để soay hình
        UIView.transition(from: cardToFlip!,
                          to: bottomCard!,
                          duration: 0.5,
                          options: [flipStyleOption, .showHideTransitionViews],
                          
                          completion: {_ in
                            self.lock = false
        })
        
    }
    //text to speech
    func voiceFlag(name : String){
        let utterance = AVSpeechUtterance(string: name)
        utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
        utterance.rate = 0.5
        let synthesizer = AVSpeechSynthesizer()
        synthesizer.speak(utterance)
    }
    
}
