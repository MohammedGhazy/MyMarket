//
//  CategoryRow.swift
//  MyMarket
//
//  Created by Mohamed Ghazy on 4/29/21.
//  Copyright © 2021 Mohamed Ghazy. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    let titleLabel  = GFTitleLabel(txtAlignment: .left, fontSize: 22)
    static let reuseId = "FollowerCell"
    var collectionView: UICollectionView!
    var dataRow: [Products] = []
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(categoryVM: Categories){
        titleLabel.text   = categoryVM.title
    }
    
    private func configure(){
        addSubview(titleLabel)
//        let layout = UICollectionViewFlowLayout()
//        layout.estimatedItemSize = CGSize(width: 40, height: 44)
//        collectionView = UICollectionView(frame: frame,collectionViewLayout: layout)
//        self.collectionView.isScrollEnabled = true
//        collectionView.delegate = self
//        collectionView.dataSource = self
//        self.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.reuseId)
//        self.addSubview(self.collectionView)
//        self.collectionView.backgroundColor = .blue
//        contentView.isUserInteractionEnabled = false
    }
}

extension TableViewCell:  UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Models.mayNeedList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.reuseId, for: indexPath) as! CollectionViewCell
        cell.backgroundColor = .red
        return cell
    }
}
