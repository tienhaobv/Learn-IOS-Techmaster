//
//  CityWeatherCell.swift
//  WeatherAppStrat
//
//  Created by Ngô Hào on 5/21/19.
//  Copyright © 2019 Ngô Hào. All rights reserved.
//

import UIKit

class CityWeatherCell: UICollectionViewCell {

    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var wetherIconImageView: UIImageView!
    @IBOutlet weak var currentDegreeLabel: UILabel!
    @IBOutlet weak var decsriptionLabel: UILabel!
    @IBOutlet weak var wetherBgImageView: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
