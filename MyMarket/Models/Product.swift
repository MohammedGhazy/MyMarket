//
//  CollectionViewCellModel.swift
//  MyMarket
//
//  Created by Mohamed Ghazy on 5/1/21.
//  Copyright © 2021 Mohamed Ghazy. All rights reserved.
//

import Foundation
import UIKit

struct Product: Equatable {
    
    var image:  UIImage
    var name: String
    var bio: String
    var price: Double
    var unit: String
}

extension Product {
    // MARK: Equatable
    static func ==(lhs: Product, rhs: Product) -> Bool {
        return lhs.name == rhs.name && lhs.price == rhs.price && lhs.unit == rhs.unit
    }
    
    func displayPrice() -> String {
        return String.init(format: "$ %.02f per %@", price, unit)
    }
}
