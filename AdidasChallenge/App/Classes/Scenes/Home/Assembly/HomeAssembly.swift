//
//  HomeAssembly.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//  
//

import Swinject
import SwinjectAutoregistration

public final class HomeAssembly: Assembly {
    
    // MARK: Lifecycle
    public init() { }
    
    // MARK: Public methods
    public func assemble(container: Container) {
        container.autoregister(HomeViewControllerFactory.self, initializer: HomeViewControllerFactory.init)
        container.autoregister(HomeInteractor.self, initializer: HomeInteractor.init)
        container.autoregister(HomePresenter.self, initializer: HomePresenter.init)
    }
}
