//
//  HomeInteractor.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//  
//

final class HomeInteractor {
    
    // MARK: Private properties
    private var presenter: HomePresenter?
    
    // MARK: Lifecycle
    init() { }
    
    // MARK: Internal methods
    func setup(with presenter: HomePresenter) {
        self.presenter = presenter
    }
}

// MARK: - Requests
extension HomeInteractor {
    
    func handleInitialize() {
        
    }
}
