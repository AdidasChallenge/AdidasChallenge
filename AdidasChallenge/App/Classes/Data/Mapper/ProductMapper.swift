//
//  ProductMapper.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 05/05/2021.
//

import Foundation

struct ProductEntityMapper {
    func map(entity: ProductEntity) -> Product? {
        guard let id = entity.id,
              let name = entity.name,
              let description = entity.description,
              let currency = entity.currency,
              let price = entity.price,
              let image = entity.imageUrl else {
            return nil
        }
        
        return .init(id: id,
                     name: name,
                     description: description,
                     currency: currency,
                     price: price,
                     image: image
        )
    }
}
