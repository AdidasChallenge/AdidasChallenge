//
//  ReviewFormInteractor.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//  
//

final class ReviewFormInteractor {
    
    // MARK: Private properties
    private var presenter: ReviewFormPresenter?
    private var router: ReviewFormRouterDelegate?
    
    private let reviewWorker: ReviewWorker
    private var product: Product?
    
    // MARK: Lifecycle
    init(reviewWorker: ReviewWorker) {
        self.reviewWorker = reviewWorker
    }
    
    // MARK: Internal methods
    func setup(with presenter: ReviewFormPresenter,
               router: ReviewFormRouterDelegate, productId: String) {
        self.presenter = presenter
        self.router = router
    }
}

// MARK: - Requests
extension ReviewFormInteractor {
    
    func handleInitialize() {
        
    }
    
    func submitReview() {
        
        // TODO: api call and on success:
        router?.dismissReviewForm()
    }
}
