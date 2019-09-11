//
//  ViewMoreButton.swift
//  ZaloClone
//
//  Created by Cuong  Pham on 8/30/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia

//MARK: Custom 1 ViewMore button riêng để tái sử dụng cho nhiều màn hình
class ViewMoreButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitle("Xem thêm >", for: .normal)
        self.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.alpha = 0.6
        self.setTitleColor(UIColor.black, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
