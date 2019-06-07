//
//  ViewController.swift
//  RotateView
//
//  Created by Techmaster on 4/26/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var clockface: UIImageView!
    @IBOutlet weak var bar: UIView!
    @IBOutlet weak var lbClockDigital: UILabel!
    @IBOutlet weak var hourBar: UIView!
    @IBOutlet weak var minuteBar: UIView!
    var gameTimer: Timer!
    var second : CGFloat = .pi*1.5//Góc quay
    var minute : CGFloat = .pi*1.5
    var hour : CGFloat = .pi*1.5//.pi/6
    var secondDigital : Int = 0
    var minuteDigital : Int = 0
    var hourDigital : Int = 0
//    var omega: CGFloat = 0.005  //Vận tốc góc
    
    override func viewDidLoad() {
        let currentDate = NSDate()
        let calendar = NSCalendar.current
        let hourDt = calendar.component(.hour, from: currentDate as Date)
        let minuteDt = calendar.component(.minute, from: currentDate as Date)
        let secondDt = calendar.component(.second, from: currentDate as Date)
        super.viewDidLoad()
        hour+=(.pi/6)*CGFloat(hourDt)
        minute+=(.pi/30)*CGFloat(minuteDt)
        second+=(.pi/30)*CGFloat(secondDt)
        secondDigital = secondDt
        minuteDigital = minuteDt
        hourDigital = hourDt
        bar.setAnchorPoint(anchorPoint: CGPoint(x:0.09,y:0.5))
        hourBar.setAnchorPoint(anchorPoint: CGPoint(x:0.12,y:0.5))
        minuteBar.setAnchorPoint(anchorPoint: CGPoint(x:0.1,y:0.5))
        clockface.center = view.center
        bar.transform = CGAffineTransform.init(rotationAngle: second)
        hourBar.transform = CGAffineTransform.init(rotationAngle: hour)
        minuteBar.transform = CGAffineTransform.init(rotationAngle: minute)
        gameTimer = Timer.scheduledTimer(timeInterval: 1,
                                        target: self,
                                        selector: #selector(runTimeCode),
                                        userInfo: nil,
                                        repeats: true)
        
        
    }
    
    @objc func runTimeCode() {
        second += .pi/30
        minute += .pi/1800
        hour += .pi/(1800*60)
        bar.transform = CGAffineTransform.init(rotationAngle: second)
        minuteBar.transform = CGAffineTransform.init(rotationAngle: minute)
        hourBar.transform = CGAffineTransform.init(rotationAngle: hour)
        secondDigital += 1
        var strSecondDigital : String = ""
        var strMinuteDigital : String = ""
        var strHourDigital : String = ""
        if secondDigital >= 60 {
            minuteDigital += 1
            secondDigital = 0
        }
        if minuteDigital >= 60 {
            hourDigital += 1
            minuteDigital = 0
        }
        if hourDigital > 23 {
            hourDigital = 0 // next day
        }
        if secondDigital<10 {
            strSecondDigital = "0"+String(secondDigital)
        }
        else{
            strSecondDigital = String(secondDigital)
        }
        if minuteDigital<10 {
            strMinuteDigital = "0"+String(minuteDigital)
        }
        else{
            strMinuteDigital = String(minuteDigital)
        }
        if hourDigital<10 {
            strHourDigital = "0"+String(hourDigital)
        }
        else{
            strHourDigital = String(hourDigital)
        }
        lbClockDigital.text = strHourDigital+":"+strMinuteDigital+":"+strSecondDigital
    }
}
extension UIView{
    func setAnchorPoint(anchorPoint: CGPoint) {
        
        var newPoint = CGPoint(x: self.bounds.size.width * anchorPoint.x, y: self.bounds.size.height * anchorPoint.y)
        var oldPoint = CGPoint(x: self.bounds.size.width * self.layer.anchorPoint.x, y: self.bounds.size.height * self.layer.anchorPoint.y)
        
        newPoint = newPoint.applying(self.transform)
        oldPoint = oldPoint.applying(self.transform)
        
        var position : CGPoint = self.layer.position
        
        position.x -= oldPoint.x
        position.x += newPoint.x;
        
        position.y -= oldPoint.y;
        position.y += newPoint.y;
        
        self.layer.position = position;
        self.layer.anchorPoint = anchorPoint;
    }
}

