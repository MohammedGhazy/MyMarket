//
//  MayNeedCell.swift
//  MyMarket
//
//  Created by Mohamed Ghazy on 4/29/21.
//  Copyright © 2021 Mohamed Ghazy. All rights reserved.
//

import UIKit

class MayNeedCell: UICollectionViewCell {
    
    static let reuseId = "FollowerCell"
    
    let avatarImage = GFAvatarImageView(frame: .zero)
    let titleLabel  = GFTitleLabel(txtAlignment: .center, fontSize: 16)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(mayNeed: MayNeedModel){
        titleLabel.text = mayNeed.title
        avatarImage.image = UIImage(named: mayNeed.avatarUrl)
    }
    
    private func configure(){
        addSubview(avatarImage)
        addSubview(titleLabel)
        
        let padding: CGFloat = 8
        
        NSLayoutConstraint.activate([
            avatarImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            avatarImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            avatarImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            avatarImage.heightAnchor.constraint(equalTo: avatarImage.widthAnchor),
            
            
            titleLabel.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 16)
            
            
        ])
    }
}
