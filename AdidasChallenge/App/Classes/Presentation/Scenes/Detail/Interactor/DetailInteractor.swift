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
    private let productWorker: ProductWorker
    
    private var searchTerm: String = ""
    
    // MARK: Lifecycle
    init(productWorker: ProductWorker) {
        self.productWorker = productWorker
    }
    
    // MARK: Internal methods
    func setup(with presenter: DetailPresenter) {
        self.presenter = presenter
    }
}

// MARK: - Requests
extension DetailInteractor {
    
    func handleInitialize() {
        productWorker.getProducts(searchTerm: searchTerm, completion: { [weak self] response in
            switch response {
            case .success(let products):
                
                self?.presenter?.presentProducts(products: products)
            case .failure(let error):
                break // TODO: Show error that something has gone wrong :)
            }
        })
    }
}
