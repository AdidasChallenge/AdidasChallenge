//
//  ProductEntity.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 05/05/2021.
//

import Foundation

struct ProductEntity: Decodable {
    let id: String?
    let name: String?
    let description: String?
    let price: Int?
    let currency: String?
    let imgUrl: String?
}
