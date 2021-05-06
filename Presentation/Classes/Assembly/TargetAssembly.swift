//
//  TargetAssembly.swift
//  Presentation
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
        SceneAssembly().assemble(container: container)
        CoordinatorAssembly().assemble(container: container)
        ViewModelMapperAssembly().assemble(container: container)
    }
}
