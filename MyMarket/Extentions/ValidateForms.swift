//
//  ValidateForms.swift
//  MyMarket
//
//  Created by Mohamed Ghazy on 4/24/21.
//  Copyright © 2021 Mohamed Ghazy. All rights reserved.
//

import Foundation
import UIKit

fileprivate func validate(_ textField: UITextField) -> (Bool, String?) {
    guard let text = textField.text else {
        return (false, nil)
    }

    if textField == passwordTextField {
        return (text.characters.count >= 6, "Your password is too short.")
    }

    return (text.characters.count > 0, "This field cannot be empty.")
}
