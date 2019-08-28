//
//  main.swift
//  TinhTienDien
//
//  Created by Ba Thoc on 8/26/19.
//  Copyright © 2019 Ba Thoc. All rights reserved.
//

import Foundation

var oldSD : Int = 1270
var SD : Int = 1600
if oldSD < SD
{
    let sdTT : Int = SD - oldSD
    var tt : Int = 0
    if sdTT <= 50 {
        tt = sdTT * 1678
    }
    else if sdTT <= 100
    {
        tt = (sdTT - 50) * 1734 + 50 * 1678
    }
    else if sdTT <= 200
    {
        tt = (sdTT - 100) * 2014 + 100 * 1734 + 50 * 1678
    }
    else if sdTT <= 300
    {
        tt = (sdTT - 200) * 2536 + 100 * 2014 + 100 * 1734 + 50 * 1678
    }
    else if sdTT <= 400
    {
        tt = (sdTT - 300) * 2834 + 100 * 2536 + 100 * 2014 + 100 * 1734 + 50 * 1678
    }
    else if sdTT > 400
    {
        tt = (sdTT - 400) * 2927 + 100 * 2834 + 100 * 2536 + 100 * 2014 + 100 * 1734 + 50 * 1678
    }
    else
    {
        print("Error")
    }
    print(tt)
}
else if oldSD == SD
{
    print("tháng này bạn không tiêu thụ điện")
}
else
{
    print("bạn nhập sai số điện")
}




