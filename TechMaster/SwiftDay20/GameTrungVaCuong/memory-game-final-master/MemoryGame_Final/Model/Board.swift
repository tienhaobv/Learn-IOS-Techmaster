//
//  Board.swift
//  MemoryGame_Final
//
//  Created by Cuong  Pham on 7/2/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import UIKit

class Board: UIView {
    var rows: Int = 0
    var cols: Int = 0
    weak var cardDelegate: CardDelegate?
    var gameLevel : Level!
    
    let margin: CGFloat = 8.0
    
    convenience init(rows: Int, cols: Int) {
        self.init()
        self.rows = rows
        self.cols = cols
    }
    
    //random các phần tử trong mảng
    func shuffleData(n : Int) -> [Int] {
        //tạo mảng random
        var data = [Int](repeating: Int.random(in: 1...n), count: rows * cols)
        
        let halfCount = data.count/2
        
        //tạo mảng đối xúng
        for i in 1..<halfCount {
            let temp = (i <= n) ? i : Int.random(in: 1...n)
            data[i] = temp
            data[i+halfCount] = temp
        }
        
        //đổi chỗ 2 phần tử random trong mảng đối xứng
        for _ in 0...halfCount {
            let i = Int.random(in: 0..<data.count)
            let j = Int.random(in: 0..<data.count)
            (data[i], data[j]) = (data[j], data[i])
        }
        
        //in ra mảng giá trị sau khi đã xáo trộn
        func debug() {
            for row in 0..<rows {
                for col in 0..<cols {
                    print("\(data[row * cols + col]) ",terminator: "")
                }
                print("")
            }
        }
        
        debug()
        return data
    }
    
    //vẽ bàn cờ với các quân bài (gọi trong viewDidAppear của ViewController)
    func constructBoard(size: CGSize, n2 : Int) {
        //tính toán chiều rộng và chiều cao của lá bài tùy thuộc vào số hàng và số cột
        let width = (size.width - CGFloat(cols + 1) * margin) / CGFloat(cols)
        let height  = (size.height - CGFloat(rows + 1) * margin ) / CGFloat(rows)
        
        //tạo mảng 1 chiều data
        let data : [Int] = shuffleData(n: n2)
        
        for row in 0..<rows {
            for col in 0..<cols {
                /*  row = 0, col = 1 thì index = 1
                             col = 2 thì index = 2
                    row = 3, col = 3 thì index = 15     */
                let index : Int = row * cols + col
                //tạo biến value bằng với phần tử thứ index trong mảng
                let value : Int = data[index]
                //tạo image với hàm createImage và giá trị value ở trên
                let image : UIImageView = createImage(value: value)
                //front view là 1 imageview với trống chỉ có màu nền
                let frontView = UIImageView()
                frontView.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
                
                let card = Card(value: value,
                                frame: CGRect(x: margin + CGFloat(col) * (margin + width),
                                              y: margin + CGFloat(row) * (margin + height),
                                              width: width,
                                              height: height),
                                front: frontView,
                                back: image,
                                delegate: cardDelegate!)
                self.addSubview(card)
            }
        }
    }
    
    //khơi tạo image
    private func createImage(value: Int) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "card\(value)")
        imageView.contentMode = .scaleToFill
        return imageView
    }
}
