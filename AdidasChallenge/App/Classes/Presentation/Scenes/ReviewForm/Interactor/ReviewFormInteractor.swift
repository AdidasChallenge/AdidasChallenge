//
//  ReviewFormInteractor.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//  
//

import Foundation

enum ResponseType {
    case error
    case text
    case rating
    
    var title: String {
        switch self {
        case .error:
            return "search_error_title".localized()
        case .text, .rating:
            return "review_form_alert_error_title".localized()
        }
    }
    
    var description: String {
        switch self {
        case .error:
            return "review_form_alert_error_description".localized()
        case .rating:
            return "review_form_alert_error_rating".localized()
        case .text:
            return "review_form_alert_error_text".localized()
        }
    }
}

final class ReviewFormInteractor {
    
    // MARK: Private properties
    private var presenter: ReviewFormPresenter?
    private var router: ReviewFormRouterDelegate?
    
    private let reviewWorker: ReviewWorker
    private var productId: String?
    
    // MARK: Lifecycle
    init(reviewWorker: ReviewWorker) {
        self.reviewWorker = reviewWorker
    }
    
    // MARK: Internal methods
    func setup(with presenter: ReviewFormPresenter,
               router: ReviewFormRouterDelegate, productId: String) {
        self.presenter = presenter
        self.router = router
        self.productId = productId
    }
}

// MARK: - Requests
extension ReviewFormInteractor {
    
    func handleInitialize() {
        
    }
    
    func submitReview(text: String, rating: Int) {
        guard let productId = productId, let locale = Locale.current.languageCode else {
            fatalError("Should not be able to submit a review without an Id")
        }
        
        guard text.isEmpty == false else {
            presenter?.presentAlert(type: .text)
            return
        }
        
        guard rating != 0 else {
            presenter?.presentAlert(type: .rating)
            return
        }
        
        reviewWorker.postReview(review: .init(productId: productId, locale: locale, text: text, rating: rating)) { [weak self] result in
            switch result {
            case .success():
                self?.router?.submitReviewForm()
            case .failure:
                self?.presenter?.presentAlert(type: .error)
            }
        }
    }
    
    func closeReview() {
        router?.dismissReviewForm()
    }
}
