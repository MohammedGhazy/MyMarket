//
//  MayNeedCollectioView.swift
//  MyMarket
//
//  Created by Mohamed Ghazy on 4/29/21.
//  Copyright © 2021 Mohamed Ghazy. All rights reserved.
//

import UIKit

class MayNeedCollectioView: UICollectionView {
    
    var mayNeed: [MayNeedModel] = []
    let view = UIView()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCollectionView(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionViewLayout = layout
        contentInset = UIEdgeInsets(top: -10, left: 0, bottom:0, right: 0)
        if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
            layout.minimumInteritemSpacing = 0
            layout.minimumLineSpacing = 0
            layout.itemSize = CGSize(width: self.view.frame.size.width-40, height: frame.size.height-10)
            layout.invalidateLayout()
        }
        delegate  = self
        backgroundColor  = .systemGreen
        register(MayNeedCell.self, forCellWithReuseIdentifier: MayNeedCell.reuseId)
    }
    
}

extension MayNeedCollectioView: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Models.mayNeedList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MayNeedCell.reuseId, for: indexPath) as!
        MayNeedCell
        let mayNeedModel     = mayNeed[indexPath.row]
        cell.set(mayNeed: mayNeedModel)
        return cell
    }
    
    
}
