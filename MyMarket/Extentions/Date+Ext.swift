//
//  Date+Ext.swift
//  MyMarket
//
//  Created by Mohamed Ghazy on 4/24/21.
//  Copyright © 2021 Mohamed Ghazy. All rights reserved.
//

import Foundation

extension Date {
    func convertToYearMonthFormat() -> String {
        let dateFormatter         = DateFormatter()
        dateFormatter.dateFormat  = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
