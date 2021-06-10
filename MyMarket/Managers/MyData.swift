//
//  MyData.swift
//  MyMarket
//
//  Created by Mohamed Ghazy on 5/1/21.
//  Copyright © 2021 Mohamed Ghazy. All rights reserved.
//

import Foundation
import UIKit

struct Images {
    var objectsArray = [
        TableViewCellModel(
            category: "Vigitables",
            images: [
                Product(image: UIImage(named: "tomatoes")!, name: "Tomatoes",bio: "Tomatoes is great for health",price: 12.0, unit: ""),
                Product(image: UIImage(named: "Carrots")!, name: "Carrots",bio: "Carrots is great for health",price: 10.0, unit: ""),
                Product(image: UIImage(named: "Cucumber")!, name: "Cucumber",bio: "Cucumber is great for health",price: 20.0, unit: ""),
                Product(image: UIImage(named: "pepper")!, name: "pepper",bio: "pepper is great for health",price: 16.0, unit: ""),
            ]
        ),
        
        TableViewCellModel(
            category: "Fruits",
            images: [
                Product(image: UIImage(named: "Mango")!, name: "Mango",bio: "Mango is great for health",price: 45.0, unit: ""),
                Product(image: UIImage(named: "Banana")!, name: "Banana",bio: "Banana is great for health",price: 24.0, unit: ""),
                Product(image: UIImage(named: "apricot")!, name: "apricot",bio: "apricot is great for health",price: 13.0, unit: ""),
                Product(image: UIImage(named: "plum")!, name: "plum",bio: "plum is great for health",price: 32.0, unit: ""),
            ]
        ),
        
        TableViewCellModel(
            category: "Others",
            images: [
                Product(image: UIImage(named: "GrapeLeaves")!, name: "Grape leaves",bio: "Grape leaves is great for health",price: 12.0, unit: ""),
        ]),
    ]
}
