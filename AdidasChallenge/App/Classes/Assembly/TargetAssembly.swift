//
//  TargetAssembly.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 07/05/2021.
//

import Swinject
import SwinjectAutoregistration

public final class TargetAssembly: Assembly {
    
    // MARK: Lifecycle
    public init() { }
    
    // MARK: Public methods
    public func assemble(container: Container) {
        SingletonAssembly().assemble(container: container)
    }
}
