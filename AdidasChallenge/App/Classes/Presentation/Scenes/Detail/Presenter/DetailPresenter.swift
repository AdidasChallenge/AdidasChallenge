//
//  DetailPresenter.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//  
//

import Foundation

final class DetailPresenter {
    
    // MARK: private properties
    private weak var displayLogic: DetailDisplayLogic?
    private var router: DetailRouterDelegate?
    
    private let productMapper: ProductViewModelMapper
    
    init(productMapper: ProductViewModelMapper) {
        self.productMapper = productMapper
    }
    
    func setup(with displayLogic: DetailDisplayLogic?, router: DetailRouterDelegate?) {
        self.displayLogic = displayLogic
        self.router = router
    }
}

// MARK: - Responses
extension DetailPresenter {
    func presentProducts(products: [Product]) {
        displayLogic?.displayProducts(tiles: productMapper.map(products: products))
    }
}
