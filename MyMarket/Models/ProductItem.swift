//
//  CartItem.swift
//  MyMarket
//
//  Created by Mohamed Ghazy on 5/3/21.
//  Copyright © 2021 Mohamed Ghazy. All rights reserved.
//

import Foundation

struct ProductItem: Codable,Hashable {
    var id          : Int
    var title       : String
    var price       : Double
    var description : String
    var category    : Category
    var image       : String
}

enum Category: String, Codable {
    case electronics = "electronics"
    case jewelery = "jewelery"
    case menSClothing = "men's clothing"
    case womenSClothing = "women's clothing"
}
