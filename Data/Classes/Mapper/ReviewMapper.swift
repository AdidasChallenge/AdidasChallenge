//
//  ReviewMapper.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 06/05/2021.
//

import Foundation
import Domain

struct ReviewEntityMapper {
    func map(entity: ReviewEntity) -> Review? {
        guard let id = entity.productId,
              let locale = entity.locale,
              let text = entity.text,
              let rating = entity.rating
        else {
            return nil
        }
        
        return .init(productId: id, locale: locale, text: text, rating: rating)
    }
}
