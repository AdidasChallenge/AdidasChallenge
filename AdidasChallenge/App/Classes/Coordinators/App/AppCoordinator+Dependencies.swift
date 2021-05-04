//
//  AppCoordinator+Dependencies.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//

extension AppCoordinator {
    struct Dependencies {
        
        // MARK: - Viewcontrollers
        let launchViewControllerFactory: LaunchViewControllerFactory
        
        // MARK: - Coordinators
        let homeCoordinatorFactory: HomeCoordinatorFactory
 
    }
}
