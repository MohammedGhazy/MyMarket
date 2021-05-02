//
//  CollectionViewCell.swift
//  MyMarket
//
//  Created by Mohamed Ghazy on 4/30/21.
//  Copyright © 2021 Mohamed Ghazy. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    static let reuseId = "CollectioViewCell"
    
    let avatarImage = GFAvatarImageView(frame: .zero)
    let titleLabel  = GFTitleLabel(txtAlignment: .center, fontSize: 12)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure(){
        addSubview(avatarImage)
        addSubview(titleLabel)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImage.heightAnchor.constraint(equalToConstant: 80),
            
            
            
            titleLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 14)
            
            
        ])
    }
}
