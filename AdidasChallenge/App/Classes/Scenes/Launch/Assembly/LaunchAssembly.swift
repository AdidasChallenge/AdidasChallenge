//
//  LaunchAssembly.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//

import Swinject
import SwinjectAutoregistration

public final class LaunchAssembly: Assembly {
    
    // MARK: Lifecycle
    public init() { }
    
    // MARK: Public methods
    public func assemble(container: Container) {
        container.autoregister(LaunchViewControllerFactory.self, initializer: LaunchViewControllerFactory.init)
        container.autoregister(LaunchInteractor.self, initializer: LaunchInteractor.init)
        container.autoregister(LaunchPresenter.self, initializer: LaunchPresenter.init)
    }
}
