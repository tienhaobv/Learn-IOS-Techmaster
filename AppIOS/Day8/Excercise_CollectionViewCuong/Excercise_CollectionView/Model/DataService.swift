//
//  DataService.swift
//  Excercise_CollectionView
//
//  Created by Cuong  Pham on 8/26/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import Foundation
import UIKit
class DataService {
    static let instance : DataService = DataService()
    
    var dataArray_1 = [
        Data_1(title: "FC Barcelona has won Copa del Rey to night", author: "Truong Anh Ngoc", image: UIImage(named: "11")!),
        Data_1(title: "Manchester United is the best team in the world", author: "Nguyen Anh Minh", image: UIImage(named: "12")!),
        Data_1(title: "Manchester United Woman is the best team in the world", author: "Doan Ha Trang", image: UIImage(named: "13")!),
        Data_1(title: "Manchester United U23 is the best team in the world", author: "Ngo Thu Trang", image: UIImage(named: "14")!)
    ]
    
    var dataArray_2 = [
        Data_2(name: "England", image: UIImage(named: "1")!, number: UIImage(named: "number")!, featured: UIImage(named: "featured")!),
        Data_2(name: "Brazil", image: UIImage(named: "2")!, number: UIImage(named: "number")!, featured: UIImage()),
        Data_2(name: "France", image: UIImage(named: "3")!, number: UIImage(), featured: UIImage(named: "featured")!),
        Data_2(name: "Vietnam", image: UIImage(named: "4")!, number: UIImage(named: "number")!, featured: UIImage(named: "featured")!),
        Data_2(name: "China", image: UIImage(named: "5")!, number: UIImage(), featured: UIImage()),
        Data_2(name: "Korea", image: UIImage(named: "6")!, number: UIImage(named: "number")!, featured: UIImage()),
        Data_2(name: "Beilgium", image: UIImage(named: "7")!, number: UIImage(), featured: UIImage()),
        Data_2(name: "Germany", image: UIImage(named: "8")!, number: UIImage(), featured: UIImage()),
        Data_2(name: "Japan", image: UIImage(named: "9")!, number: UIImage(), featured: UIImage(named: "featured")!),
        Data_2(name: "Italy", image: UIImage(named: "10")!, number: UIImage(named: "number")!, featured: UIImage())
    ]
}
