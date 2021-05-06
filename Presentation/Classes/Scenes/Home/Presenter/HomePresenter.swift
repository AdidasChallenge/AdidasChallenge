//
//  HomePresenter.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//  
//

import Foundation
import Domain

final class HomePresenter {
    
    // MARK: private properties
    private weak var displayLogic: HomeDisplayLogic?
    
    private let productMapper: ProductViewModelMapper
    
    init(productMapper: ProductViewModelMapper) {
        self.productMapper = productMapper
    }
    
    func setup(with displayLogic: HomeDisplayLogic?) {
        self.displayLogic = displayLogic
    }
}

// MARK: - Responses
extension HomePresenter {
    func presentProducts(products: [Product]) {
        displayLogic?.displayProducts(tiles: productMapper.map(products: products))
    }
    
    func presentLoading(display: Bool) {
        displayLogic?.displayLoading(display: display)
    }
    
    func presentError(retryAction: (() -> Void)?) {
        displayLogic?.displayErrorView(viewModel: ErrorView.ViewModel(title: "search_error_description".localized(), retryAction: retryAction))
    }
}
