//
//  ThemVC.swift
//  TabBarNavigationController
//
//  Created by Techmaster on 5/21/19.
//  Copyright © 2019 Techmaster. All rights reserved.
//

import UIKit
import Stevia

class ThemVC: UIViewController {
    
    let dataService = DataService.instance
    //MARK: khởi tạo các collection view, mỗi collection view sẽ đi kèm với 1 view bao bọc nó
    var functionCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    lazy var subFunctionCollection : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var bestSaleCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    lazy var subBestSaleCollection : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var stickerCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    lazy var subStickerCollection : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var channelCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    lazy var subChannelCollection : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    //----------------------------------------------------------------------------------
    
    var accountTableView : UITableView = UITableView()
    lazy var subAccountTableView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var mainScrollView : UIScrollView = {
        let scroll = UIScrollView()
        scroll.contentSize.height = 1450
        scroll.contentOffset = CGPoint(x: 0, y: 0)
        scroll.backgroundColor = .lightGray
        return scroll
    }()
    var searchBar = SearchBarView()
    
    lazy var headerView : UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    lazy var userNameLabel : UILabel = {
        let label = UILabel()
        label.text = "Cuong Pham"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textColor = .black
        label.sizeToFit()
        return label
    }()
    
    lazy var editLabel : UILabel = {
        let label = UILabel()
        label.text = "Edit profile"
        label.textColor = .black
        label.sizeToFit()
        label.font = UIFont.systemFont(ofSize: 15)
        label.alpha = 0.8
        return label
    }()
    
    lazy var avatarImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "avatar")
        image.layer.cornerRadius = 35
        image.clipsToBounds = true
        return image
    }()
    
    lazy var editButton : UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "edit"), for: .normal)
        return button
    }()
    
    lazy var bestSaleLabel : UILabel = {
        let label = UILabel()
        label.text = "Bán chạy"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.sizeToFit()
        label.textColor = .black
        return label
    }()
    
    lazy var stickerLabel : UILabel = {
        let label = UILabel()
        label.text = "Sticker"
        label.textColor = .black
        label.sizeToFit()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    lazy var channelLabel : UILabel = {
        let label = UILabel()
        label.text = "Channel"
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.sizeToFit()
        return label
    }()
    
    lazy var accountLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.text = "Gợi ý Offical Account"
        label.sizeToFit()
        label.textColor = .black
        return label
    }()
    
    var viewMoreBestSaleButton = ViewMoreButton()
    var viewMoreStickerButton = ViewMoreButton()
    var viewMoreChannelButton = ViewMoreButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    //MARK: set up layout
        setUpSearchBar()
        setUpScrollView()
        setUpHeaderView()
        setUpFunctionCollectionView()
        setUpBestSaleCollectionView()
        setUpStickerCollectionView()
        setUpChannelCollectionView()
        setUpTableView()
    //MARK: load data
        dataService.loadFunctionData()
        dataService.loadBestSaleList()
        dataService.loadStickerArray()
        dataService.loadChannelData()
        dataService.loadAccountData()
    }
    
    fileprivate func setUpScrollView(){
        view.sv(mainScrollView)
        mainScrollView.centerInContainer().width(100%)
        mainScrollView.Top == searchBar.Bottom
    }
    
    fileprivate func setUpHeaderView(){
        mainScrollView.sv(headerView)
        headerView.Top == mainScrollView.Top
        headerView.width(100%).centerHorizontally().height(80)
        
        headerView.sv(avatarImage, userNameLabel, editLabel, editButton)
        avatarImage.size(70).centerVertically()
        avatarImage.Leading == headerView.Leading + 10
        
        userNameLabel.Leading == avatarImage.Trailing + 20
        userNameLabel.Top == avatarImage.Top
        
        editLabel.Leading == userNameLabel.Leading
        editLabel.Top == userNameLabel.Bottom + 10
        
        editButton.Trailing == headerView.Trailing - 15
        editButton.Top == avatarImage.Top + 5
        editButton.size(30)
    }
    
    fileprivate func setUpSearchBar(){
        view.sv(searchBar)
        searchBar.Top == view.safeAreaLayoutGuide.Top
        searchBar.width(100%).centerHorizontally().height(50)
    }
    
    fileprivate func setUpFunctionCollectionView(){
    //MARK: đầu tiên add 1 view trắng tinh vào mainScrollView, sau đó add collection view lên trên view đó
        mainScrollView.sv(subFunctionCollection)
        
        subFunctionCollection.centerHorizontally().width(100%).height(300)
        subFunctionCollection.Top == headerView.Bottom + 5
        
        subFunctionCollection.sv(functionCollectionView)
        //set width và height bằng 98% và 96% để các item trong collection view sẽ cách top, bottom, trailing, leading ra 1 khoảng
        functionCollectionView.centerHorizontally().width(90%).height(96%).centerVertically()
        functionCollectionView.backgroundColor = .white
        
        functionCollectionView.delegate = self
        functionCollectionView.dataSource = self
        functionCollectionView.register(FunctionCell.self, forCellWithReuseIdentifier: "FunctionCell")
    }
    
    fileprivate func setUpBestSaleCollectionView(){
    //MARK: layout cho sub view
        mainScrollView.sv(subBestSaleCollection)
        subBestSaleCollection.centerHorizontally().width(100%).height(250)
        subBestSaleCollection.Top == subFunctionCollection.Bottom + 5
    //-----------------------------
        subBestSaleCollection.sv(bestSaleCollectionView, bestSaleLabel, viewMoreBestSaleButton)
    //MARK: layout cho best label
        bestSaleLabel.Leading == subBestSaleCollection.Leading + 15
        bestSaleLabel.Top == subBestSaleCollection.Top + 10
    //-----------------------
    //MARK: layout cho view more
        viewMoreBestSaleButton.Top == subBestSaleCollection.Top + 5
        viewMoreBestSaleButton.Trailing == subBestSaleCollection.Trailing - 15
        viewMoreBestSaleButton.width(100).height(30)
    //-------------------------
    //MARK: layout cho collection view va set up
        //bestSaleCollectionView.centerInContainer().width(90%).height(96%)
        bestSaleCollectionView.Leading == subBestSaleCollection.Leading + 15
        bestSaleCollectionView.Trailing == subBestSaleCollection.Trailing
        bestSaleCollectionView.Top == bestSaleLabel.Bottom + 15
        bestSaleCollectionView.Bottom == subBestSaleCollection.Bottom - 10
        bestSaleCollectionView.backgroundColor = .white
        
        bestSaleCollectionView.delegate = self
        bestSaleCollectionView.dataSource = self
        bestSaleCollectionView.register(BestSaleCell.self, forCellWithReuseIdentifier: "BestSale")
        if let flowLayout1 = bestSaleCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout1.scrollDirection = .horizontal
        }
    //---------------------------------------------
    }
    
    fileprivate func setUpStickerCollectionView(){
    //MARK: layout cho sub view
        mainScrollView.sv(subStickerCollection)
        subStickerCollection.centerHorizontally().width(100%).height(200)
        subStickerCollection.Top == subBestSaleCollection.Bottom + 5
    //------------------------
        subStickerCollection.sv(stickerLabel, viewMoreStickerButton, stickerCollectionView)
    //MARK: layout sticker label
        stickerLabel.Leading == subStickerCollection.Leading + 15
        stickerLabel.Top == subStickerCollection.Top + 10
    //--------------------------
    //MARK: layout cho view more button
        viewMoreStickerButton.Top == subStickerCollection.Top + 5
        viewMoreStickerButton.Trailing == subStickerCollection.Trailing - 15
        viewMoreStickerButton.width(100).height(30)
    //----------------------------
    //MARK: layouyt cho sticker collection view
        stickerCollectionView.Leading == subStickerCollection.Leading + 15
        stickerCollectionView.Trailing == subStickerCollection.Trailing
        stickerCollectionView.Top == stickerLabel.Bottom + 15
        stickerCollectionView.Bottom == subStickerCollection.Bottom - 10
        stickerCollectionView.backgroundColor = .white
    //-----------------------------------------
        stickerCollectionView.delegate = self
        stickerCollectionView.dataSource = self
        stickerCollectionView.register(StickerCell.self, forCellWithReuseIdentifier: "Sticker")
        if let flowLayout2 = stickerCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout2.scrollDirection = .horizontal
        }
    }
    
    fileprivate func setUpChannelCollectionView(){
        mainScrollView.sv(subChannelCollection)
        subChannelCollection.width(100%).centerHorizontally().height(250)
        subChannelCollection.Top == subStickerCollection.Bottom + 5
        subChannelCollection.backgroundColor = .white
        
        subChannelCollection.sv(channelLabel, viewMoreChannelButton, channelCollectionView)
        
        channelLabel.Leading == subChannelCollection.Leading + 15
        channelLabel.Top == subChannelCollection.Top + 10
        
        viewMoreChannelButton.Top == subChannelCollection.Top + 5
        viewMoreChannelButton.Trailing == subChannelCollection.Trailing - 15
        viewMoreChannelButton.width(100).height(30)
        
        channelCollectionView.Leading == subChannelCollection.Leading + 15
        channelCollectionView.Trailing == subChannelCollection.Trailing
        channelCollectionView.Top == channelLabel.Bottom + 15
        channelCollectionView.Bottom == subChannelCollection.Bottom - 10
        channelCollectionView.backgroundColor = .white
        channelCollectionView.delegate = self
        channelCollectionView.dataSource = self
        channelCollectionView.register(ChannelCell.self, forCellWithReuseIdentifier: "Channel")
        if let flowLayout3 = channelCollectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout3.scrollDirection = .horizontal
        }
    }
    
    fileprivate func setUpTableView(){
        mainScrollView.sv(subAccountTableView)
        subAccountTableView.centerHorizontally().width(100%).height(350)
        subAccountTableView.Top == subChannelCollection.Bottom + 5
        
        subAccountTableView.sv(accountLabel, accountTableView)
        
        accountLabel.Top == subAccountTableView.Top + 10
        accountLabel.Leading == subAccountTableView.Leading + 15
        
        accountTableView.width(100%).height(300).centerHorizontally()
        accountTableView.Top == accountLabel.Bottom + 15
        accountTableView.backgroundColor = .lightGray
        
        accountTableView.delegate = self
        accountTableView.dataSource = self
        accountTableView.register(AccountCell.self, forCellReuseIdentifier: "Account")
    }
}


extension ThemVC : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case functionCollectionView:
            return dataService.functionArray.count
        case bestSaleCollectionView:
            return dataService.bestSaleArray.count
        case stickerCollectionView:
            return dataService.stickerArray.count
        case channelCollectionView:
            return dataService.channelArray.count
        default:
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView {
        case functionCollectionView:
            guard let cell1 = functionCollectionView.dequeueReusableCell(withReuseIdentifier: "FunctionCell", for: indexPath) as? FunctionCell else {
                fatalError("error")
            }
            cell1.setUpDataForCell(function: dataService.functionArray[indexPath.row])
            return cell1
        case bestSaleCollectionView:
            guard let cell2 = bestSaleCollectionView.dequeueReusableCell(withReuseIdentifier: "BestSale", for: indexPath) as? BestSaleCell else {
                fatalError("fail")
            }
            cell2.updateData(_bestSale: dataService.bestSaleArray[indexPath.row])
            return cell2
        case stickerCollectionView:
            guard let cell3 = stickerCollectionView.dequeueReusableCell(withReuseIdentifier: "Sticker", for: indexPath) as? StickerCell else {
                fatalError("fail")
            }
            cell3.updateData(_sticker: dataService.stickerArray[indexPath.row])
            return cell3
        case channelCollectionView:
            guard let cell4 = channelCollectionView.dequeueReusableCell(withReuseIdentifier: "Channel", for: indexPath) as? ChannelCell else{
                fatalError("fail")
            }
            cell4.updateData(_channel: dataService.channelArray[indexPath.row])
            return cell4
        default:
            return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch collectionView {
        case functionCollectionView:
            return CGSize(width: 80, height: 80)
        case bestSaleCollectionView:
            return CGSize(width: 150, height: 120)
        case stickerCollectionView:
            return CGSize(width: 120, height: 100)
        case channelCollectionView:
            return CGSize(width: 180, height: 140)
        default:
            return CGSize(width: 0, height: 0)
        }    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 20
    }
}


extension ThemVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataService.accountArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = accountTableView.dequeueReusableCell(withIdentifier: "Account", for: indexPath) as? AccountCell else {
            fatalError("fail")
        }
        cell.setUpData(_account: dataService.accountArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
