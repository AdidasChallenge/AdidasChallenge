//
//  AppCoordinatorFactory.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//

import Swinject

// MARK: Factory
public struct AppCoordinatorFactory {
    let dependencies: AppCoordinator.Dependencies
    
    public func make() -> AppCoordinator {
        AppCoordinator(dependencies: dependencies)
    }
}
