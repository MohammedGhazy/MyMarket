//
//  MayNeed.swift
//  MyMarket
//
//  Created by Mohamed Ghazy on 4/29/21.
//  Copyright © 2021 Mohamed Ghazy. All rights reserved.
//

import Foundation
struct Products: Codable,Hashable{
    let avatarUrl: String
    var title: String?
    var location: String?
    var bio: String?
}
