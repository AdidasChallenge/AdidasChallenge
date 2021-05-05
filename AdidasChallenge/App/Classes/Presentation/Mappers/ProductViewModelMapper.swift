//
//  ProductViewModelMapper.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 05/05/2021.
//

import Foundation

struct ProductViewModelMapper {
    func map(products: [Product]) -> [ProductTile.ViewModel] {
        products.map( {
            return ProductTile.ViewModel(
                id: $0.id,
                thumbnail: $0.image,
                title: $0.name,
                description: $0.description,
                price: $0.price
            )
        })
    }
}
