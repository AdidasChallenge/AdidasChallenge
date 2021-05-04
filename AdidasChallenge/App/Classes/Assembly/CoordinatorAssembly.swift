//
//  CoordinatorAssembly.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//

import Swinject
import SwinjectAutoregistration

public final class CoordinatorAssembly: Assembly {
    
    public init() { }
    
    public func assemble(container: Container) {
        
        // MARK: - Factories
        container.autoregister(AppCoordinatorFactory.self, initializer: AppCoordinatorFactory.init)
        container.autoregister(HomeCoordinatorFactory.self, initializer: HomeCoordinatorFactory.init)
        
        // MARK: - Dependencies
        container.autoregister(AppCoordinator.Dependencies.self, initializer: AppCoordinator.Dependencies.init)
        container.autoregister(HomeCoordinator.Dependencies.self, initializer: HomeCoordinator.Dependencies.init)
    }
}
