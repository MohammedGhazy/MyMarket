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
                CollectionViewCellModel(image: UIImage(named: "tomatoes")!, name: "Tomatoes",bio: "Tomatoes is great for health",prise: 12.0),
                CollectionViewCellModel(image: UIImage(named: "Carrots")!, name: "Carrots",bio: "Carrots is great for health",prise: 10.0),
                CollectionViewCellModel(image: UIImage(named: "Cucumber")!, name: "Cucumber",bio: "Cucumber is great for health",prise: 20.0),
                CollectionViewCellModel(image: UIImage(named: "pepper")!, name: "pepper",bio: "pepper is great for health",prise: 16.0),
            ]
        ),
        
        TableViewCellModel(
            category: "Fruits",
            images: [
                CollectionViewCellModel(image: UIImage(named: "Mango")!, name: "Mango",bio: "Mango is great for health",prise: 45.0),
                CollectionViewCellModel(image: UIImage(named: "Banana")!, name: "Banana",bio: "Banana is great for health",prise: 24.0),
                CollectionViewCellModel(image: UIImage(named: "apricot")!, name: "apricot",bio: "apricot is great for health",prise: 13.0),
                CollectionViewCellModel(image: UIImage(named: "plum")!, name: "plum",bio: "plum is great for health",prise: 32.0),
            ]
        ),
        
        TableViewCellModel(
            category: "Others",
            images: [
                CollectionViewCellModel(image: UIImage(named: "GrapeLeaves")!, name: "Grape leaves",bio: "Grape leaves is great for health",prise: 12.0),
        ]),
    ]
}
