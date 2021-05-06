//
//  ReviewEntity.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 06/05/2021.
//

import Foundation

struct ReviewEntity: Decodable {
    let productId: String?
    let locale: String?
    let rating: Int?
    let text: String?
}
