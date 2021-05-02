//
//  MayNeedList.swift
//  MyMarket
//
//  Created by Mohamed Ghazy on 4/29/21.
//  Copyright © 2021 Mohamed Ghazy. All rights reserved.
//

import Foundation

struct Models {
    
   static let mayNeedList = [
        Products(avatarUrl: "vig1", title: "Cucumber", location: "Mansoura", bio: "Good Cucumber"),
        Products(avatarUrl: "vig2", title: "Tomatoes", location: "El-Mahla", bio: "Good Tomatoes"),
        Products(avatarUrl: "vig3", title: "Carrots", location: "Cairo", bio: "Good Carrots"),
    ]
    
   static let category = [
       Categories(title: "vigitables"),
       Categories(title: "Fruits"),
       Categories(title: "Other"),
   ]
    
}
