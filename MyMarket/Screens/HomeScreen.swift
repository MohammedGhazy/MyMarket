//
//  HomeScreen.swift
//  MyMarket
//
//  Created by Mohamed Ghazy on 4/24/21.
//  Copyright © 2021 Mohamed Ghazy. All rights reserved.
//

import UIKit

class HomeScreen: UIViewController {
    
    let carouselCard            = CarouselCardModel()
    let pageController          = UIPageControl()
    let carouselImage           = UIImageView()
    var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //configureCollectioView()
    }
    
    func configureCollectioView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection  = .horizontal
        layout.itemSize         = CGSize(width: view.frame.width, height: view.frame.height)
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
        collectionView.automaticallyAdjustsScrollIndicatorInsets = false
        collectionView.setContentOffset(.zero, animated: true)
        collectionView.backgroundColor  = .systemGreen
        collectionView.isPagingEnabled  = true
        collectionView.delegate         = self
        collectionView.dataSource       = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(CarouselCell.self, forCellWithReuseIdentifier: CarouselCell.reuseID)
        
        view.addSubview(collectionView)
        collectionView.addSubview(carouselImage)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            collectionView.heightAnchor.constraint(equalToConstant: 200),
        ])
    }
}

extension HomeScreen: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UIScrollViewDelegate, UIPageViewControllerDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CarouselCell.reuseID, for: indexPath) as! CarouselCell
        cell.carouselImage.image   = carouselCard.carouselImage[indexPath.row]
        cell.layer.cornerRadius  = 0.6
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width, height: collectionView.bounds.size.height)
    }
}
