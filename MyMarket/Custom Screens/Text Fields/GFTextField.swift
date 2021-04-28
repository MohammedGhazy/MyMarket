//
//  GFTextField.swift
//  MyMarket
//
//  Created by Mohamed Ghazy on 4/24/21.
//  Copyright © 2021 Mohamed Ghazy. All rights reserved.
//

import UIKit

class GFTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureMyTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(placeholder: String , isSecure: Bool) {
        super.init(frame: .zero)
        self.placeholder        = placeholder
        self.isSecureTextEntry  = isSecure
        configureMyTextField()
    }
    
    
    private func configureMyTextField(){
        translatesAutoresizingMaskIntoConstraints   = false
        layer.cornerRadius                          = 5
        layer.borderWidth                           = 2
        layer.borderColor                           = UIColor.white.cgColor
        
        textColor                                   = .label
        tintColor                                   = .label

        
        backgroundColor                             = .tertiarySystemBackground
        
        textAlignment                               = .center
        returnKeyType                               = .next
        
        adjustsFontSizeToFitWidth                   = true
        minimumFontSize                             = 12
        autocorrectionType                          = .no
        
        layer.shadowOpacity = 2
        layer.shadowRadius = 4.0
        layer.shadowOffset = CGSize.zero
        layer.shadowColor = UIColor.systemGray4.cgColor
        
        font = UIFont.preferredFont(forTextStyle: .title2)
    }
    
}
