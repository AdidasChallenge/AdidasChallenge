//
//  HomePresenter.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//  
//

import Foundation

final class HomePresenter {
    
    // MARK: private properties
    private weak var displayLogic: HomeDisplayLogic?
    private var router: HomeRouterDelegate?
    
    private let productMapper: ProductViewModelMapper
    
    init(productMapper: ProductViewModelMapper) {
        self.productMapper = productMapper
    }
    
    func setup(with displayLogic: HomeDisplayLogic?, router: HomeRouterDelegate?) {
        self.displayLogic = displayLogic
        self.router = router
    }
}

// MARK: - Responses
extension HomePresenter {
    func presentProducts(products: [Product]) {
        displayLogic?.displayProducts(tiles: productMapper.map(products: products))
    }
}
