//
//  DataService.swift
//  ZaloClone
//
//  Created by Cuong  Pham on 8/29/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import Foundation
import UIKit

class DataService {
    static let instance = DataService()
    
    var functionArray : Array<Function> = []
    var bestSaleArray : Array<BestSale> = []
    var stickerArray : Array<Sticker> = []
    var channelArray : Array<Channel> = []
    var accountArray : Array<Account> = []
    
    func loadFunctionData(){
        functionArray.append(Function(_title: "Tìm quanh đây", _image: UIImage(named: "location")!))
        functionArray.append(Function(_title: "Phòng trò chuyện", _image: UIImage(named: "chat")!))
        functionArray.append(Function(_title: "Shop", _image: UIImage(named: "cart")!))
        functionArray.append(Function(_title: "Sticker", _image: UIImage(named: "smile")!))
        functionArray.append(Function(_title: "Channel", _image: UIImage(named: "channel")!))
        functionArray.append(Function(_title: "eGoverment", _image: UIImage(named: "gov")!))
        functionArray.append(Function(_title: "Bank", _image: UIImage(named: "bank")!))
        functionArray.append(Function(_title: "Transport", _image: UIImage(named: "bus")!))
        functionArray.append(Function(_title: "Data", _image: UIImage(named: "data")!))
    }
    
    func loadBestSaleList(){
        bestSaleArray.append(BestSale(_name: "Hàng Việt Nam xuất khẩu", _image: UIImage(named: "sale1")!, _sale: "-20%", _price: "123.000 đ"))
        bestSaleArray.append(BestSale(_name: "Hàng Việt Nam", _image: UIImage(named: "sale2")!, _sale: "-30%", _price: "1.123.000 đ"))
        bestSaleArray.append(BestSale(_name: "Hàng đẹp", _image: UIImage(named: "sale3")!, _sale: "-30%", _price: "11.123.000 đ"))
        bestSaleArray.append(BestSale(_name: "Hàng Việt Nam xuất khẩu", _image: UIImage(named: "sale4")!, _sale: "-20%", _price: "123.000 đ"))
        bestSaleArray.append(BestSale(_name: "Hàng Việt Nam xuất khẩu", _image: UIImage(named: "sale5")!, _sale: "-20%", _price: "123.000 đ"))
        bestSaleArray.append(BestSale(_name: "Hàng Việt Nam", _image: UIImage(named: "sale6")!, _sale: "-10%", _price: "13.000 đ"))
        bestSaleArray.append(BestSale(_name: "Hàng chất lượng cao", _image: UIImage(named: "sale7")!, _sale: "-30%", _price: "1.223.000 đ"))
        bestSaleArray.append(BestSale(_name: "Hàng Việt", _image: UIImage(named: "sale8")!, _sale: "-5%", _price: "123.000 đ"))
        bestSaleArray.append(BestSale(_name: "Hàng xuất khẩu", _image: UIImage(named: "sale9")!, _sale: "-20%", _price: "2.123.000 đ"))
        bestSaleArray.append(BestSale(_name: "Hàng Việt Nam", _image: UIImage(named: "sale10")!, _sale: "-10%", _price: "1.123.000 đ"))
    }
    
    func loadStickerArray(){
        stickerArray.append(Sticker(_name: "Elephant", _image: UIImage(named: "elephant")!))
        stickerArray.append(Sticker(_name: "Giraffe", _image: UIImage(named: "giraffe")!))
        stickerArray.append(Sticker(_name: "Koala", _image: UIImage(named: "koala")!))
        stickerArray.append(Sticker(_name: "Monkey", _image: UIImage(named: "monkey")!))
        stickerArray.append(Sticker(_name: "Panda", _image: UIImage(named: "panda")!))
        stickerArray.append(Sticker(_name: "Parrot", _image: UIImage(named: "parrot")!))
        stickerArray.append(Sticker(_name: "Racoon", _image: UIImage(named: "racoon")!))
        stickerArray.append(Sticker(_name: "Sloth", _image: UIImage(named: "sloth")!))
        stickerArray.append(Sticker(_name: "Tiger", _image: UIImage(named: "tiger")!))
    }
    
    func loadChannelData(){
        channelArray.append(Channel(_name: "Bốc thăm chia bảng cúp C1", _image: UIImage(named: "c1")!))
        channelArray.append(Channel(_name: "NÓNG: Sanchez chia tay MU", _image: UIImage(named: "sanchez")!))
        channelArray.append(Channel(_name: "Cháy lớn tại kho xưởng ở Thanh Xuân", _image: UIImage(named: "chay")!))
        channelArray.append(Channel(_name: "Thêm một cặp đôi đình đám chia tay nhau", _image: UIImage(named: "chia-tay")!))
        channelArray.append(Channel(_name: "ĐTVN chốt danh sách triệu tập 23 cầu thủ", _image: UIImage(named: "park")!))
        channelArray.append(Channel(_name: "Cháy rừng nghiêm trọng tại Amazon", _image: UIImage(named: "amazon")!))
        channelArray.append(Channel(_name: "Lukaku 'nổ súng' trong trận ra mắt Inter Milan", _image: UIImage(named: "lukaku")!))
        channelArray.append(Channel(_name: "Ngọc Trinh khoe đồ hiệu xuống phố", _image: UIImage(named: "trinh")!))
    }
    
    func loadAccountData(){
        accountArray.append(Account(_avatar: UIImage(named: "mu")!, _name: "Manchester United", _info: "The best football club in the world with a lot of achievement"))
        accountArray.append(Account(_avatar: UIImage(named: "obama")!, _name: "Barrack Obama", _info: "The former USA President from 2008 to 2016"))
        accountArray.append(Account(_avatar: UIImage(named: "becks")!, _name: "David Beckham", _info: "The former Man United's player and the most handsome footballer in the world"))
    }
}
