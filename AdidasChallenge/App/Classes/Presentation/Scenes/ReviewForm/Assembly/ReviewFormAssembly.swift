//
//  ReviewFormAssembly.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//  
//

import Swinject
import SwinjectAutoregistration

public final class ReviewFormAssembly: Assembly {
    
    // MARK: Lifecycle
    public init() { }
    
    // MARK: Public methods
    public func assemble(container: Container) {
        container.autoregister(ReviewFormViewControllerFactory.self, initializer: ReviewFormViewControllerFactory.init)
        container.autoregister(ReviewFormInteractor.self, initializer: ReviewFormInteractor.init)
        container.autoregister(ReviewFormPresenter.self, initializer: ReviewFormPresenter.init)
    }
}
