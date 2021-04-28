//
//  CarouselCollectionView.swift
//  MyMarket
//
//  Created by Mohamed Ghazy on 4/28/21.
//  Copyright © 2021 Mohamed Ghazy. All rights reserved.
//

import UIKit

class CarouselCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {

    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCollectioView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection  = .horizontal
        layout.itemSize         = .zero
        
        automaticallyAdjustsScrollIndicatorInsets = false
        setContentOffset(.zero, animated: true)
        backgroundColor  = .systemBackground
        isPagingEnabled  = true
        delegate         = self
        dataSource       = self
        translatesAutoresizingMaskIntoConstraints = false
        register(CarouselCell.self, forCellWithReuseIdentifier: CarouselCell.reuseID)
        
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            leadingAnchor.constraint(equalTo: view.leadingAnchor),
            trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
