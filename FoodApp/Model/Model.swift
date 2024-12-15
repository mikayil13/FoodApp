//
//  Model.swift
//  FoodApp
//
//  Created by Mikayil on 08.12.24.
//

import Foundation

struct Food:Codable {
    var foodName: String?
    var foodImage: String?
    var item: [FoodItem]?
}

struct FoodItem: Codable {
    var itemName: String?
    var itemImage: String?
    var price : Double?
}
