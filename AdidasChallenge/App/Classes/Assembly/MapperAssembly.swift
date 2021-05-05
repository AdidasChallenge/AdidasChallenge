//
//  MapperAssembly.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 05/05/2021.
//

import Foundation
import Swinject
import SwinjectAutoregistration

// swiftlint:disable force_cast force_unwrapping
final class MapperAssembly: Assembly {
    
    // MARK: Internal methods
    func assemble(container: Container) {
        
        // MARK: - Entity mappers
        container.autoregister(ProductEntityMapper.self, initializer: ProductEntityMapper.init)
        
        // MARK: - ViewModel Mappers
        container.autoregister(ProductViewModelMapper.self, initializer: ProductViewModelMapper.init)
        
    }
}
