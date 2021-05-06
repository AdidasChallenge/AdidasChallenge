//
//  HomeCoordinator+Dependencies.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//

extension HomeCoordinator {
    struct Dependencies {
        let homeViewControllerFactory: HomeViewControllerFactory
        let detailViewControllerFactory: DetailViewControllerFactory
        let reviewFormViewControllerFactory: ReviewFormViewControllerFactory
    }
}
