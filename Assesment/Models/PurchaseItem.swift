//
//  PurchaseItem.swift
//  Assesment
//
//  Created by Joseph on 23/01/2022.
//

import Foundation


protocol PurchaseItemProtocol {
    var image: String? { get }
    var purchaseDate: String? { get }
    var itemName: String? { get }
    var price: String? { get }
    var serial: String? { get }
    var feedDescription: String? { get }
}

struct PurchaseItem: Codable, PurchaseItemProtocol {
    var image: String?
    var purchaseDate, itemName, price, serial: String?
    var feedDescription: String?
    
    enum CodingKeys: String, CodingKey {
        case image
        case purchaseDate = "purchase_date"
        case itemName = "item_name"
        case price, serial
        case feedDescription = "description"
    }
}
