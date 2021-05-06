//
//  AppAssembly.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//

import Swinject
import SwinjectAutoregistration

import Domain
import Data
import Presentation

public final class AppAssembly: Assembly {
    
    // MARK: Lifecycle
    public init() { }
    
    // MARK: Public methods
    public func assemble(container: Container) {
        TargetAssembly().assemble(container: container)
        Presentation.TargetAssembly().assemble(container: container)
        DataAssembly().assemble(container: container)
        
    }
}
