//
//  MapperAssembly.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 05/05/2021.
//

import Foundation
import Swinject
import SwinjectAutoregistration
import Domain

// swiftlint:disable force_cast force_unwrapping
public final class MapperAssembly: Assembly {
    
    public init() { }
    
    // MARK: Internal methods
    public func assemble(container: Container) {
        
        // MARK: - Entity mappers
        container.autoregister(ProductEntityMapper.self, initializer: ProductEntityMapper.init)
        container.autoregister(ReviewEntityMapper.self, initializer: ReviewEntityMapper.init)
    }
}
