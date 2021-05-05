//
//  LaunchViewControllerFactory.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//

import Swinject

// MARK: Factory
struct LaunchViewControllerFactory {
    
    let interactorProvider: Provider<LaunchInteractor>
    let presenterProvider: Provider<LaunchPresenter>
    
    func make(with router: LaunchRouterDelegate) -> LaunchViewController {
        let interactor = interactorProvider.instance
        let presenter = presenterProvider.instance
        let viewController = LaunchViewController(interactor: interactor)
        
        interactor.setup(with: presenter, router: router)
        presenter.setup(with: viewController)
        
        return viewController
    }
}
