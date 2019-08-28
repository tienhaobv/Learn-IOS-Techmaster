
import UIKit
import Stevia

class MainScreen: UIViewController {
    
    let dataService : DataService = DataService.instance
    
    lazy var mainImage : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "background")
        return image
    }()
    
    var headerView_1 = HeaderView_1()
    var headerView_2 = HeaderView_2()
    
    var collectionView_1 : UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    
    var collectionView_2 : UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())

    fileprivate func setUpCollectionView_1() {
        collectionView_1.delegate = self
        collectionView_1.dataSource = self
        collectionView_1.register(CustomCell_1.self, forCellWithReuseIdentifier: "Cell_1")
        if let flowLayout_1 = collectionView_1.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout_1.scrollDirection = .horizontal
        }
        collectionView_1.backgroundColor = .clear
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLayout()
        setUpCollectionView_1()
        setUpCollectionView_2()
    }
    
    fileprivate func setUpCollectionView_2(){
        collectionView_2.delegate = self
        collectionView_2.dataSource = self
        collectionView_2.backgroundColor = .clear
        if let flowLayout_2 = collectionView_2.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout_2.scrollDirection = .vertical
        }
        collectionView_2.register(CustomCell_2.self, forCellWithReuseIdentifier: "Cell_2")
    }
    
    fileprivate func setUpLayout(){
        view.sv(mainImage, collectionView_1, collectionView_2)
        
        mainImage.Top == view.Top
        mainImage.Leading == view.Leading
        mainImage.Trailing == view.Trailing
        mainImage.Bottom == view.Bottom
        
        mainImage.sv(headerView_1, headerView_2)
        
        headerView_1.Top == view.safeAreaLayoutGuide.Top + 20
        headerView_1.centerHorizontally().height(35)
        headerView_1.Trailing == view.Trailing - 10
        headerView_1.Leading == view.Leading + 10
        
        collectionView_1.Top == headerView_1.Bottom
        collectionView_1.Leading == view.Leading + 10
        collectionView_1.Trailing == view.Trailing - 10
        collectionView_1.height(30%)
        
        headerView_2.Top == collectionView_1.Bottom + 20
        headerView_2.centerHorizontally().height(35)
        headerView_2.Trailing == view.Trailing - 10
        headerView_2.Leading == view.Leading + 10
        
        collectionView_2.Top == headerView_2.Bottom
        collectionView_2.Leading == view.Leading + 10
        collectionView_2.Trailing == view.Trailing - 10
        collectionView_2.Bottom == view.safeAreaLayoutGuide.Bottom
    }
}

extension MainScreen : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView_1{
            return dataService.dataArray_1.count
        }else{
            return dataService.dataArray_2.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.collectionView_1 {
            guard let cell1 = collectionView_1.dequeueReusableCell(withReuseIdentifier: "Cell_1", for: indexPath) as? CustomCell_1 else {
                fatalError("error")
            }
            cell1.configureCell(_data_1: dataService.dataArray_1[indexPath.row])
            return cell1
        }else{
            guard let cell2 = collectionView_2.dequeueReusableCell(withReuseIdentifier: "Cell_2", for: indexPath) as? CustomCell_2 else {
                fatalError("error")
            }
            cell2.configureCell(_data: dataService.dataArray_2[indexPath.row])
            return cell2
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionView_1 {
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }else {
            return CGSize(width: (collectionView.frame.width - 10) / 2, height: 200)
        }
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        return 20
//    }
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        return 20
//    }
}
