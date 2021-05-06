//
//  LaunchInteractor.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//

final class LaunchInteractor {
    
    // MARK: Private properties
    private var presenter: LaunchPresenter?
    private var router: LaunchRouterDelegate?
    
    // MARK: Lifecycle
    init() { }
    
    // MARK: Internal methods
    func setup(with presenter: LaunchPresenter, router: LaunchRouterDelegate) {
        self.presenter = presenter
        self.router = router
    }
}

// MARK: - Requests
extension LaunchInteractor {
    
    func handleInitialize() {
        router?.launchDidComplete()
    }
}
