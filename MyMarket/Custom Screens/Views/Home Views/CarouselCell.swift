//
//  CarouselCell.swift
//  MyMarket
//
//  Created by Mohamed Ghazy on 4/28/21.
//  Copyright © 2021 Mohamed Ghazy. All rights reserved.
//

import UIKit

class CarouselCell: UICollectionViewCell {
    
    static let reuseID = "carouselCell"
    
    let carouselImage     = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
        configureImage()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureImage(){
        carouselImage.translatesAutoresizingMaskIntoConstraints = false
        carouselImage.contentMode = .scaleToFill
    }
    
    private func configure(){
        contentView.addSubview(carouselImage)
        
        NSLayoutConstraint.activate([
            carouselImage.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            carouselImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            carouselImage.heightAnchor.constraint(equalToConstant: self.bounds.height),
            carouselImage.widthAnchor.constraint(equalToConstant: self.bounds.width),
            
        ])
    }
}
