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
        container.autoregister(ReviewEntityMapper.self, initializer: ReviewEntityMapper.init)
        
        // MARK: - ViewModel Mappers
        container.autoregister(ProductViewModelMapper.self, initializer: ProductViewModelMapper.init)
        container.autoregister(ContentDetailViewModelMapper.self, initializer: ContentDetailViewModelMapper.init)
        container.autoregister(ReviewContentViewModelMapper.self, initializer: ReviewContentViewModelMapper.init)
        
    }
}
