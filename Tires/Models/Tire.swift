//
//  Tire.swift
//  Tires
//
//  Created by Mikhail on 27.09.2017.
//  Copyright © 2017 Mikhail. All rights reserved.
//

import Foundation

class Tire {
    var model = ""
    var image = ""
    var price = 0
    var size = ""
    var isAdded = false
    var season = ""
    var rating = "rating"
    
    init(model: String, image: String, price: Int, size: String, isAdded: Bool, season: String) {
        self.model = model
        self.image = image
        self.price = price
        self.size = size
        self.isAdded = isAdded
        self.season = season
    }
}
