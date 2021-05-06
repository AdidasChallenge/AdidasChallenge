//
//  ViewModelMapperAssembly.swift
//  Presentation
//
//  Created by Jesse Klijn on 07/05/2021.
//

import Swinject
import SwinjectAutoregistration

public final class ViewModelMapperAssembly: Assembly {
    
    public init() { }
    
    public func assemble(container: Container) {
        
        // MARK: - ViewModel Mappers
        container.autoregister(ProductViewModelMapper.self, initializer: ProductViewModelMapper.init)
        container.autoregister(ContentDetailViewModelMapper.self, initializer: ContentDetailViewModelMapper.init)
        container.autoregister(ReviewContentViewModelMapper.self, initializer: ReviewContentViewModelMapper.init)

    }
}
