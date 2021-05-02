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
                CollectionViewCellModel(image: UIImage(named: "vig1")!, name: "Tomatoes",bio: "Tomatoes is great for health",prise: 12.0),
                    CollectionViewCellModel(image: UIImage(named: "vig1")!, name: "Carrots",bio: "Carrots is great for health",prise: 10.0),
                    CollectionViewCellModel(image: UIImage(named: "vig1")!, name: "ahmed",bio: "ahmed is great for health",prise: 20.0),
                    CollectionViewCellModel(image: UIImage(named: "vig1")!, name: "eslam",bio: "eslam is great for health",prise: 16.0),
            ]
        ),
        
        TableViewCellModel(
            category: "Fruits",
            images: [
                    CollectionViewCellModel(image: UIImage(named: "vig2")!, name: "Mango",bio: "Mango is great for health",prise: 45.0),
                    CollectionViewCellModel(image: UIImage(named: "vig2")!, name: "Banana",bio: "Banana is great for health",prise: 24.0),
                    CollectionViewCellModel(image: UIImage(named: "vig2")!, name: "Mango",bio: "Mango is great for health",prise: 13.0),
                    CollectionViewCellModel(image: UIImage(named: "vig2")!, name: "Banana",bio: "Banana is great for health",prise: 32.0),
            ]
        ),
        
        TableViewCellModel(
            category: "Others",
            images: [
                    CollectionViewCellModel(image: UIImage(named: "vig3")!, name: "Orchid",bio: "Orchid is great for health",prise: 12.0),
                    CollectionViewCellModel(image: UIImage(named: "vig3")!, name: "Orchid",bio: "Orchid is great for health",prise: 12.0),
                    CollectionViewCellModel(image: UIImage(named: "vig3")!, name: "Orchid",bio: "Orchid is great for health",prise: 12.0),
                    CollectionViewCellModel(image: UIImage(named: "vig3")!, name: "Orchid",bio: "Orchid is great for health",prise: 12.0),
            ]),
        ]
}
