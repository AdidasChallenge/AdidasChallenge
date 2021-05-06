//
//  HomeCoordinatorFactory.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//

import Swinject

// MARK: Factory
struct HomeCoordinatorFactory {
    let dependencies: HomeCoordinator.Dependencies
    
    func make() -> HomeCoordinator {
        HomeCoordinator(dependencies: dependencies)
    }
}
