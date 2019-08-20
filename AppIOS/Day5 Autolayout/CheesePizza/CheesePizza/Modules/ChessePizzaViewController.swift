//
//  ChessePizzaViewController.swift
//  CheesePizza
//
//  Created by Tào Quỳnh on 5/21/19.
//  Copyright © 2019 Tào Quỳnh. All rights reserved.
//

import UIKit
import Stevia

class ChessePizzaViewController: UIViewController {

    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = UIColor.clear
        
        return scrollView
    }()
    
    let containerView: UIView = {
        let customView = UIView()
        customView.backgroundColor = .white
        return customView
    }()
    
    let circleBackView: UIView = {
        let customView = UIView()
        
        customView.backgroundColor = UIColor(red:0.04, green:0.13, blue:0.19, alpha:1.0)
        
        return customView
    }()
    
    let pizzaImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "pizza")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let topView = StepView()
    
    let viewBottom = UIView()
    
    let stepLabel: UILabel = {
        let label = UILabel()
        label.text = "STEP 1"
        label.textColor = .white
        return label
    }()
    
    let namePizzaView = NamePizzaView()
    
    let sizeLabel: UILabel = {
        let label = UILabel()
        label.text = "Size"
        label.textColor = .lightGray
        return label
    }()
    
    let sizePizzaView = SizePizzaView()
    
    let quantityLabel: UILabel = {
        let label = UILabel()
        label.text = "Quantity"
        label.textColor = .lightGray
        return label
    }()
    
    let quantityView = QuantityView()
    
    let styleCakeLabel: UILabel = {
        let label = UILabel()
        label.text = "StyleOfCake"
        label.textColor = .lightGray
        return label
    }()
    
    let styleCakeView = StyleCakeView()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Other Description"
        label.textColor = .lightGray
        return label
    }()
    
    let descriptionView = DescriptionView()
    
    let nextStepButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next Step", for: .normal)
        button.layer.cornerRadius = 20
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(red:0.04, green:0.13, blue:0.19, alpha:1.0)
        return button
    }()
    
    let widthScreen = UIScreen.main.bounds.width
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addControl()
        setupLayout()
        setupControl()
        
        scrollView.delegate = self
    }
    
    func addControl(){
        view.sv(
            scrollView.sv(
                containerView.sv(
                    circleBackView,
                    pizzaImageView,
                    viewBottom.sv(
                        namePizzaView,
                        sizeLabel,
                        sizePizzaView,
                        quantityLabel,
                        quantityView,
                        styleCakeLabel,
                        styleCakeView,
                        descriptionLabel,
                        descriptionView
                    )
                )
            ),
            topView,
            nextStepButton
        )
    }

    func setupLayout(){
        
        view.layout(
            40,
            |-16-topView-16-| ~ 40
        )

        view.layout(
            0,
            |-0-scrollView-0-|,
            0
        )

        view.layout(
            |-20-nextStepButton-20-| ~ 40,
            8
        )

        scrollView.layout(
            0,
            |-0-containerView.width(widthScreen)-0-|,
            0
        )

        containerView.layout(
            -((widthScreen * 1.5)/5 * 3),
            |-circleBackView.size(widthScreen * 1.5)-|
        )
        circleBackView.centerHorizontally()

        pizzaImageView.centerHorizontally()
        containerView.layout(
            widthScreen/4,
            |-pizzaImageView.size(widthScreen/8 * 5)-|,
            0,
            |-0-viewBottom-0-|,
            0
        )

        viewBottom.layout(
            8,
            |-namePizzaView-| ~ 40,
            2,
            |-20-sizeLabel-20-| ~ 40,
            2,
            |-20-sizePizzaView-20-|,
            16,
            |-20-quantityLabel-20-| ~ 40,
            2,
            |-20-quantityView-20-| ~ 40,
            16,
            |-20-styleCakeLabel-20-| ~ 40,
            2,
            |-20-styleCakeView-20-| ~ 40,
            16,
            |-20-descriptionLabel-20-| ~ 40,
            2,
            |-20-descriptionView-20-|,
            80
        )
        namePizzaView.centerHorizontally()
    }
    
    func setupControl(){
        circleBackView.layer.cornerRadius = (widthScreen * 1.5)/2
    }
}

extension ChessePizzaViewController: UIScrollViewDelegate {
    
    // Báo cho delegate khi người dùng bắt đầu cuộn, và được gọi khi độ lệch nội dung của chế độ xem thay đổi
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print(scrollView.contentOffset)
    }
    
    
}
