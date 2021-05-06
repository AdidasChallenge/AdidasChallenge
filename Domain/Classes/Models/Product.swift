//
//  Product.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 05/05/2021.
//

import Foundation

public struct Product {
    public let id: String
    public let name: String
    public let description: String
    public let currency: String
    public let price: String
    public let image: String?
    
    public init(
        id: String,
        name: String,
        description: String,
        currency: String,
        price: String,
        image: String?
        ) {
        self.id = id
        self.name = name
        self.description = description
        self.currency = currency
        self.price = price
        self.image = image
    }
}
