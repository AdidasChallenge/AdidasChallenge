//
//  ReviewFormViewControllerFactory.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//  
//

import Swinject

// MARK: Factory
struct ReviewFormViewControllerFactory {
    
    let interactorProvider: Provider<ReviewFormInteractor>
    let presenterProvider: Provider<ReviewFormPresenter>
    
    func make(with router: ReviewFormRouterDelegate, productId: String) -> ReviewFormViewController {
        let interactor = interactorProvider.instance
        let presenter = presenterProvider.instance
        let viewController = ReviewFormViewController(interactor: interactor)
        
        interactor.setup(with: presenter, router: router, productId: productId)
        presenter.setup(with: viewController)
        
        return viewController
    }
}
