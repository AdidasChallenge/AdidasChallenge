//
//  DetailInteractor.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//  
//

final class DetailInteractor {
    
    // MARK: Private properties
    private var presenter: DetailPresenter?
    private var router: DetailRouterDelegate?
    
    private let reviewWorker: ReviewWorker
    private var product: Product?
    
    // MARK: Lifecycle
    init(reviewWorker: ReviewWorker) {
        self.reviewWorker = reviewWorker
    }
    
    // MARK: Internal methods
    func setup(with presenter: DetailPresenter,
               router: DetailRouterDelegate,
               product: Product) {
        self.presenter = presenter
        self.router = router
        self.product = product
    }
}

// MARK: - Requests
extension DetailInteractor {
    
    func handleInitialize() {
        guard let product = product else { return }
        presenter?.presentDetail(product: product)
        
        getReviews()
    }
    
    private func getReviews() {
        guard let product = product else { return }
        reviewWorker.getReviewsFor(id: product.id, completion: { [weak self] result in
            switch result {
            case .success(let reviews):
                self?.presenter?.presentReviews(reviews: reviews)
            case .failure:
                break // TODO: Show error
            }
        })
    }
    
    func didTapBack() {
        router?.dismissDetail()
    }
    
    func addReview() {
        router?.addReview(completion: { [weak self] in
            self?.getReviews()
        })
    }
}
