//
//  RandomWord.swift
//  WordSearch
//
//  Created by Trung Le on 7/8/19.
//  Copyright © 2019 Trung Le. All rights reserved.
//

import Foundation

var alphabet2 = ["a","a","a","a","a","a","a","a", "b" ,"b" , "c" ,"c" ,"c" , "d","d","d","d", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e", "e" , "f" ,"f" , "g" ,"g" , "h" ,"h" ,"h" ,"h" ,"h" ,"h" , "i","i","i","i","i","i","i", "j" , "k" , "l" ,"l" ,"l" ,"l" , "m" ,"m" , "n" ,"n" ,"n" ,"n" ,"n" ,"n" ,"n" ,"n" , "o","o","o","o","o","o","o", "p", "p" , "q" , "r" ,"r" ,"r" ,"r" ,"r" ,"r" , "s" ,"s" ,"s" ,"s" ,"s" ,"s" , "t", "t", "t", "t", "t", "t", "t", "t", "t", "u" ,"u" ,"u" , "v" , "w" ,"w" ,"w" , "x" , "y" ,"y" , "z"]
let col = 8
let row = 8
// word lấy random từ SQL
let word = ["computer", "swift", "coding", "summer", "macos" ]
var arr = [[String]]()

func wordSearch1(){
    
    //khởi tạo mảng 2 chiều row*col
    for _ in 0..<row{
        var columnArray = Array<String>()
        for _ in 0..<col{
            columnArray.append("-")
        }
        arr.append(columnArray)
    }
    // vòng for để lấy các chuỗi kí tự từ mảng word
    for j in 0..<word.count{
        // khởi tạo mảng nhớ toạ độ của kí tự được xếp trước
        var xy = [(Int,Int)]()
        
        var isWord = true // để nhận biết là kí tự đầu tiên của chuỗi
        for i in word[j]{
            var arrs = [(Int, Int)]() // mảng chứa toạ độ các kí tự trong chuỗi
            if isWord{
                var rows: Int
                var cols: Int
                
                // kiểm tra ô còn trống
                repeat{
                    rows = Int.random(in: 0..<row)
                    cols = Int.random(in: 0..<col)
                    print("\(rows) \(cols)")
                } while arr[rows][cols] != "-"
                
                // điền kí tự đầu tiên vào ô khi ô còn trống
                xy.removeAll()
                xy.append((rows,cols))
                arrs.append((rows,cols))
                arr[rows][cols].removeAll()
                arr[rows][cols].append(i)
                isWord = false
                
            }else{
                sapXep(&xy, &arrs, i)
            }
        }
        for i in 0..<row{
            for j in 0..<col{
                print(arr[i][j],terminator: " ")
            }
            print("")
        }
    }
    
    // random điền các kí tự vào các ô con trống
    for i in 0..<row{
        for j in 0..<col{
            if arr[i][j] == "-"{
                arr[i][j].removeAll()
                arr[i][j].append(alphabet2.randomElement()!)
            }
        }
        
    }
    print("")
    for i in 0..<row{
        for j in 0..<col{
            print(arr[i][j],terminator: " ")
        }
        print("")
    }
    
}
func sapXep(_ xy: inout [(Int,Int)], _ arrs: inout [(Int,Int)],_ i: Character ){
    
    // mảng xyz để lưu toạ độ 8 ô xung quanh kí tự đã xếp trước
    var xyz = [(Int,Int)]()
    // mảng xyza để lưu toạ độ các ô kí tự đang xét có thể bỏ vào
    var xyza = [(Int,Int)]()
    
    xyz.append((xy[0].0 - 1, xy[0].1 - 1))
    xyz.append((xy[0].0 - 1, xy[0].1))
    xyz.append((xy[0].0 - 1, xy[0].1 + 1))
    xyz.append((xy[0].0 , xy[0].1 - 1))
    xyz.append((xy[0].0 , xy[0].1 + 1))
    xyz.append((xy[0].0 + 1, xy[0].1 - 1))
    xyz.append((xy[0].0 + 1, xy[0].1 ))
    xyz.append((xy[0].0 + 1, xy[0].1 + 1))
    for j in 0..<xyz.count-1{
        
        if xyz[j].0 < 0 || xyz[j].1 < 0 || xyz[j].0 >= row || xyz[j].1 >= col{
            
        }else if arr[xyz[j].0][xyz[j].1] == "-" {
            xyza.append(xyz[j])
        }
    }
    
    print(xyza.count)
    // nếu không có toạ độ nào để điền từ tiếp theo thì xoá các kí tự đã điền từ trước
    if xyza.count > 0 {
        let toado = xyza.randomElement()
        arrs.append(toado!)
        arr[toado!.0][toado!.1].removeAll()
        arr[toado!.0][toado!.1].append(i)
        xy.removeAll()
        xy.append(toado!)
    }else{
        for i in arrs{
            arr[i.0][i.1].removeAll()
        }
    }
    
}


