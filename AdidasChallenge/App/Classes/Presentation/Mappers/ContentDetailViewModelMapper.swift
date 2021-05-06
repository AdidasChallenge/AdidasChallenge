//
//  ContentDetailViewModelMapper.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 06/05/2021.
//

import Foundation

struct ContentDetailViewModelMapper {
    func map(product: Product) -> DetailContentView.ViewModel {
        .init(
            id: product.id,
            thumbnail: product.image,
            title: product.name,
            description: product.description,
            price: product.price
        )
    }
}
