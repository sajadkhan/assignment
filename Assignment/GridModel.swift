//
//  GridModel.swift
//  Assignment
//
//  Created by Muhammad Sajad on 17/02/2019.
//  Copyright © 2019 Muhammad Sajad. All rights reserved.
//

import Foundation

struct GridItem {
    let name: String
}

struct GridModel {
    static let defaultCount = 50
    
    //It will return 50 items
    static func items() -> [GridItem]  {
        return itemsFor(count: defaultCount)
    }
    
    //As many as you want
    static func itemsFor(count: Int) -> [GridItem] {
        var items = [GridItem]()
        for i in 0..<count {
            items.append(GridItem(name: "Item \(i)"))
        }
        return items
    }
}
