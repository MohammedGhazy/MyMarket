//
//  CartTableViewCell.swift
//  MyMarket
//
//  Created by Mohamed Ghazy on 5/3/21.
//  Copyright © 2021 Mohamed Ghazy. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    static let reuseId = "CartTableViewCell"
    
    let productImage   = GFAvatarImageView(frame: .zero)
    let titleLabel     = GFTitleLabel(txtAlignment: .left, fontSize: 14)
    let secondaryLabel = GFSecandryTitleLabel(fontSize: 12)

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(products: ProductItem){
        titleLabel.text     = products.title
        secondaryLabel.text = products.description
        productImage.downloadImage(from: products.image)
    }
    
    private func configure(){
        addSubview(productImage)
        addSubview(titleLabel)
        addSubview(secondaryLabel)
        
        let padding:CGFloat = 12
        
        NSLayoutConstraint.activate([
            productImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            productImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: padding),
            productImage.heightAnchor.constraint(equalToConstant: 60),
            productImage.widthAnchor.constraint(equalToConstant: 60),
            
            titleLabel.topAnchor.constraint(equalTo: productImage.topAnchor,constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            titleLabel.heightAnchor.constraint(equalToConstant: 18),
            
            secondaryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            secondaryLabel.leadingAnchor.constraint(equalTo: productImage.trailingAnchor,constant: padding),
            secondaryLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            secondaryLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
}
