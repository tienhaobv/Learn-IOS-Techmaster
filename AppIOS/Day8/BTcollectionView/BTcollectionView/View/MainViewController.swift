//
//  MainViewController.swift
//  BTcollectionView
//
//  Created by Ba Thoc on 8/27/19.
//  Copyright © 2019 Ba Thoc. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let collectionViewHorizontal : UICollectionView = {
        
        // tạo ra layout để tự căn chỉnh cột
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        // khởi tạo collectionview và chuyền vào layout
        let collectionView = UICollectionView (frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(HorizontalCollectionViewCell.self, forCellWithReuseIdentifier: "cellHorizontal")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
//        // thay đổi hướng scroll của collectionView
//        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowLayout.scrollDirection = .horizontal
//        }
        
        return collectionView
    }()
    
    let collectionViewVertical : UICollectionView = {
        
        // tạo ra layout để tự căn chỉnh cột
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        // khởi tạo collectionview và chuyền vào layout
        let collectionView = UICollectionView (frame: CGRect.zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.register(VerticalCollectionViewCell.self, forCellWithReuseIdentifier: "cellVertical")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
//        // thay đổi hướng scroll của collectionView
//        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
//            flowLayout.scrollDirection = .vertical
//        }
        
        return collectionView
    }()
    
    let data: ArraysData = ArraysData()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionViewHorizontal.dataSource = self
        collectionViewHorizontal.delegate = self
        collectionViewVertical.dataSource = self
        collectionViewVertical.delegate = self
        view.backgroundColor = .white
        setupLayout()
    }
    
    func setupLayout() {
//        var btnSearch: UIButton = {
//            let btn = UIButton()
//            btn.setImage(UIImage(named: "search"), for: .normal)
//            return btn
//        }()
//
//        var titleHeader: UILabel = {
//            let title = UILabel()
//            title.text = "Feature"
//            title.font = UIFont.boldSystemFont(ofSize: 22)
////            title.font = UIFont(name: "SF-Pro-Display-Bold", size: 25)
//            title.textColor = .white
//            return title
//        }()
//
//        var headerView : UIView = UIView(frame: CGRect.zero)
//        view.addSubview(headerView)
//        headerView.translatesAutoresizingMaskIntoConstraints = false
//        headerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10)
//        headerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0)
//        headerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0)
//        headerView.heightAnchor.constraint(equalToConstant: 40)
//
//        headerView.addSubview(titleHeader)
//        titleHeader.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
//        titleHeader.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 10)
////        titleHeader.heightAnchor.constraint(equalToConstant: 35)
//
//        headerView.addSubview(btnSearch)
//        btnSearch.centerYAnchor.constraint(equalTo: headerView.centerYAnchor)
//        btnSearch.rightAnchor.constraint(equalTo: headerView.rightAnchor, constant: 10)
//        btnSearch.heightAnchor.constraint(equalToConstant: 35)
//        btnSearch.widthAnchor.constraint(equalToConstant: 35)
//
        view.addSubview(collectionViewHorizontal)
        view.addSubview(collectionViewVertical)
//        collectionViewHorizontal.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        collectionViewHorizontal.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        collectionViewHorizontal.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        collectionViewHorizontal.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        collectionViewHorizontal.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        collectionViewVertical.topAnchor.constraint(equalTo: collectionViewHorizontal.bottomAnchor, constant: 20).isActive = true
        collectionViewVertical.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        collectionViewVertical.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        collectionViewVertical.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10).isActive = true
    }
    

}


extension MainViewController:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    // hàm trả về số item có thể thao tác trong một section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionViewHorizontal {
            return data.arrayHorizontal.count
        }
        else {
            return data.arrayVertical.count
        }
    }
    
    // hàm trả về nội dung của một item
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionViewHorizontal {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellHorizontal", for: indexPath) as! HorizontalCollectionViewCell
            // đổ dữ liệu của từng thằng đề cài đặt giao diện cho nó
            cell.setupCell(data: data.arrayHorizontal[indexPath.row])
            
            return cell
        }
        else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellVertical", for: indexPath) as! VerticalCollectionViewCell
            // đổ dữ liệu của từng thằng đề cài đặt giao diện cho nó
            cell.setupCell(data: data.arrayVertical[indexPath.row])
            
            return cell
        }
    }
    
    //hàm trả về kích thước của item
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // tính kích thước size một cạnh của item
        if collectionView == self.collectionViewHorizontal {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }else {
            return CGSize(width: (collectionView.frame.width - 10) / 2, height: 200)
        }
    }
    
    // hàm trả về khoảng cách giữa hai hàng
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    // hàm trả về khoảng cách giữa 2 item (tương tự 2 cột)
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    // hàm chọn item
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
////        let item = foods[indexPath.row]
////        print(item.name)
//    }
    
    
}
