//
//  HorizontalCollectionViewCell.swift
//  BTcollectionView
//
//  Created by Ba Thoc on 8/27/19.
//  Copyright © 2019 Ba Thoc. All rights reserved.
//

import UIKit

class HorizontalCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // khởi tạo containerView
    let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.clear
        return view
    }()
    
    // khởi tạo imageView
    let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "")
        return imageView
    }()
    
    // khởi tạo title
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .white
        return label
    }()
    
    // khởi tạo author
    let authorLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        return label
    }()
    
    func setupLayout(){
        addSubview(containerView)
        containerView.addSubview(photoImageView)
        containerView.addSubview(authorLabel)
        containerView.addSubview(titleLabel)
        
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
//        containerView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
        containerView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        containerView.widthAnchor.constraint(equalToConstant: 400).isActive = true
//        containerView.rightAnchor.constraint(equalTo: rightAnchor, constant: -4).isActive = true
        
        photoImageView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 0).isActive = true
        photoImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        photoImageView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 0).isActive = true
        photoImageView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        
        authorLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 0).isActive = true
        authorLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 8).isActive = true
        authorLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        authorLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        titleLabel.bottomAnchor.constraint(equalTo: authorLabel.topAnchor, constant: 0).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 8).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: 0).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    func setupCell(data: DataHorizontal) {
        titleLabel.text = data.title
        authorLabel.text = data.author
        photoImageView.image = data.image
    }
}
