//
//  DetailPresenter.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//  
//

import Foundation
import Domain

final class DetailPresenter {
    
    // MARK: private properties
    private weak var displayLogic: DetailDisplayLogic?
    
    private let contentDetailViewModelMapper: ContentDetailViewModelMapper
    private let reviewContentViewModelMapper: ReviewContentViewModelMapper
    
    init(
        contentDetailViewModelMapper: ContentDetailViewModelMapper,
        reviewContentViewModelMapper: ReviewContentViewModelMapper
    ) {
        self.contentDetailViewModelMapper = contentDetailViewModelMapper
        self.reviewContentViewModelMapper = reviewContentViewModelMapper
    }
    
    func setup(with displayLogic: DetailDisplayLogic?) {
        self.displayLogic = displayLogic
    }
}

// MARK: - Responses
extension DetailPresenter {
    
    func presentDetail(product: Product) {
        displayLogic?.presentDetail(viewModel: contentDetailViewModelMapper.map(product: product))
    }
    
    func presentReviews(reviews: [Review]) {
        displayLogic?.presentReviews(viewModel: reviewContentViewModelMapper.map(reviews: reviews))
    }
    
    func presentError(retryAction: (() -> Void)?) {
        displayLogic?.presentError(retryAction: retryAction)
    }
}
