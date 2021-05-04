//
//  HomePresenter.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//  
//

import Foundation

final class HomePresenter {
    
    // MARK: private properties
    private weak var displayLogic: HomeDisplayLogic?
    private var router: HomeRouterDelegate?
    
    func setup(with displayLogic: HomeDisplayLogic?, router: HomeRouterDelegate?) {
        self.displayLogic = displayLogic
        self.router = router
    }
}

// MARK: - Responses
extension HomePresenter {
    
}
