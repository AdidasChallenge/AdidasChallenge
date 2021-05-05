//
//  DetailAssembly.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//  
//

import Swinject
import SwinjectAutoregistration

public final class DetailAssembly: Assembly {
    
    // MARK: Lifecycle
    public init() { }
    
    // MARK: Public methods
    public func assemble(container: Container) {
        container.autoregister(DetailViewControllerFactory.self, initializer: DetailViewControllerFactory.init)
        container.autoregister(DetailInteractor.self, initializer: DetailInteractor.init)
        container.autoregister(DetailPresenter.self, initializer: DetailPresenter.init)
    }
}
