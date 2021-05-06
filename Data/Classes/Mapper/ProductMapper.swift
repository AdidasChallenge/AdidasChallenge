//
//  ProductMapper.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 05/05/2021.
//

import Foundation
import Domain

struct ProductEntityMapper {
    func map(entity: ProductEntity) -> Product? {
        guard let id = entity.id,
              let name = entity.name,
              let description = entity.description,
              let price = entity.price
        else {
            return nil
        }
        
        return .init(id: id,
                     name: name,
                     description: description,
                     currency: entity.currency ?? "$",
                     price: "\(price)",
                     image: entity.imgUrl
        )
    }
}
