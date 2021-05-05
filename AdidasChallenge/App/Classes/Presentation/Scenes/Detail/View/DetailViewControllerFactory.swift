//
//  DetailViewControllerFactory.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//  
//

import Swinject

// MARK: Factory
struct DetailViewControllerFactory {
    
    let interactorProvider: Provider<DetailInteractor>
    let presenterProvider: Provider<DetailPresenter>
    
    func make(with router: DetailRouterDelegate) -> DetailViewController {
        let interactor = interactorProvider.instance
        let presenter = presenterProvider.instance
        let viewController = DetailViewController(interactor: interactor)
        
        interactor.setup(with: presenter)
        presenter.setup(with: viewController, router: router)
        
        return viewController
    }
}
