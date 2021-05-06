//
//  WorkerAssembly.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 05/05/2021.
//

import Foundation
import Swinject
import SwinjectAutoregistration

// swiftlint:disable force_cast force_unwrapping
final class WorkerAssembly: Assembly {
    
    // MARK: Internal methods
    func assemble(container: Container) {
        container.autoregister(ProductWorker.self, initializer: ProductService.init)
        container.autoregister(ReviewWorker.self, initializer: ReviewService.init)
    }
}
