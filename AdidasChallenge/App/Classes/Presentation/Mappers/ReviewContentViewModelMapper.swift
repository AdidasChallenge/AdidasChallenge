//
//  ReviewContentViewModelMapper.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 06/05/2021.
//

import Foundation

struct ReviewContentViewModelMapper {
    func map(reviews: [Review]) -> ReviewContentView.ViewModel {
        .init(title: "content_detail_reviews_title".localized(),
              rows:
                reviews.map( {
                    return ReviewTile.ViewModel(
                        productId: $0.productId,
                        locale: $0.locale,
                        text: $0.text,
                        rating: $0.rating
                    )
                })
              )
        
    }
}
