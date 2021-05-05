//
//  AppAssembly.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//

import Swinject
import SwinjectAutoregistration

public final class AppAssembly: Assembly {
    
    // MARK: Lifecycle
    public init() { }
    
    // MARK: Public methods
    public func assemble(container: Container) {
        SceneAssembly().assemble(container: container)
        CoordinatorAssembly().assemble(container: container)
        SingletonAssembly().assemble(container: container)
        WorkerAssembly().assemble(container: container)
        MapperAssembly().assemble(container: container)
    }
}
