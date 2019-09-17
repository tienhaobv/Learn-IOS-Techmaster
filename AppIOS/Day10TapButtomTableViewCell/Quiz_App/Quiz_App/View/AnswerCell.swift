//
//  AnswerCell.swift
//  Quiz_App
//
//  Created by Cuong  Pham on 9/9/19.
//  Copyright © 2019 Cuong  Pham. All rights reserved.
//

import UIKit
import Stevia

protocol CustomCellDelegate {
    func changeStateButton(index : IndexPath)
}

class AnswerCell: UITableViewCell {
    
    var _index : IndexPath!
    var delegate : CustomCellDelegate?
    
    var chooseButton : UIButton = {
        let button = UIButton()
        button.imageView?.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(onTap), for: .touchUpInside)
        return button
    }()
    
    @objc func onTap(){
        self.delegate?.changeStateButton(index: _index)
    }
    
    lazy var contentAnswerLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.textColor = .white
        label.sizeToFit()
        return label
    }()
    
    fileprivate func setUpLayout(){
        self.sv(contentAnswerLabel)
        contentAnswerLabel.centerInContainer()
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        setUpLayout()
        // Configure the view for the selected state
    }

}
