//
//  DescriptionScreen.swift
//  MyMarket
//
//  Created by Mohamed Ghazy on 5/1/21.
//  Copyright © 2021 Mohamed Ghazy. All rights reserved.
//

import UIKit

class DescriptionScreen: UIViewController {
        
    let containerView: UIView = {
        let containerView = UIView()
        containerView.backgroundColor       = .systemBackground
        containerView.layer.cornerRadius    = 12
        containerView.layer.borderWidth     = 1
        containerView.layer.borderColor     = UIColor.systemBackground.cgColor
        return containerView
    }()
    
    let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.clipsToBounds      = true
        //imageView.image              = UIImage(named: "vig1")
        return imageView
    }()
    
    let secondaryLabel = GFSecandryTitleLabel(fontSize: 18)
    let titleLabel     = GFTitleLabel(txtAlignment: .left, fontSize: 20)
    let txtField       = GFTextField(placeholder: "how many kilos", isSecure: false)
    let cartButton     = GFButton(color: .systemGreen, title: "Add to Cart")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureViews()
    }
    
    func configureViews(){
        view.addSubview(containerView)
        view.addSubview(secondaryLabel)
        view.addSubview(titleLabel)
        view.addSubview(cartButton)
        view.addSubview(txtField)
        containerView.addSubview(imageView)
        
        containerView.translatesAutoresizingMaskIntoConstraints  = false
        imageView.translatesAutoresizingMaskIntoConstraints      = false
        secondaryLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints     = false
        cartButton.translatesAutoresizingMaskIntoConstraints     = false
        txtField.translatesAutoresizingMaskIntoConstraints       = false
        
        let padding:CGFloat = 8
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            containerView.heightAnchor.constraint(equalToConstant: 160),
            
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 160),
            
            titleLabel.topAnchor.constraint(equalTo: containerView.bottomAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            titleLabel.heightAnchor.constraint(equalToConstant: 24),
            
            secondaryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: padding),
            secondaryLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            secondaryLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            secondaryLabel.heightAnchor.constraint(equalToConstant: 24),
            
            txtField.topAnchor.constraint(equalTo: secondaryLabel.bottomAnchor, constant: padding),
            txtField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            txtField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
            
            cartButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -padding),
            cartButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
            cartButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
        ])
    }

}
