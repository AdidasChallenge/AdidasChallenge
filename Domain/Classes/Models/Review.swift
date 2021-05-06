//
//  Review.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 06/05/2021.
//

import Foundation

public struct Review {
    public let productId: String
    public let locale: String
    public let text: String
    public let rating: Int
    
    public init(
        productId: String,
        locale: String,
        text: String,
        rating: Int
    ) {
        self.productId = productId
        self.locale = locale
        self.text = text
        self.rating = rating
    }
}
