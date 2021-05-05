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
    
    private var product: Product?
    
    // MARK: Lifecycle
    init() { }
    
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
        
    }
}
