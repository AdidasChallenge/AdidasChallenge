//
//  DataAssembly.swift
//  Data
//
//  Created by Jesse Klijn on 07/05/2021.
//

import Swinject
import SwinjectAutoregistration

public final class DataAssembly: Assembly {
    
    // MARK: Lifecycle
    public init() { }
    
    // MARK: Public methods
    public func assemble(container: Container) {
        MapperAssembly().assemble(container: container)
        ServiceAssembly().assemble(container: container)
    }
}
