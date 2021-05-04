//
//  ApplicationDependencies.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//

import Swinject

final class ApplicationDependencies {
    
    // MARK: Internal properties
    let container: Container = Container()
    
    // MARK: Private properties
    private lazy var assembler = Assembler(container: container)
    private let assemblies: [Assembly] = [
        AppAssembly()
    ]
    
    // MARK: Lifecycle
    init() {
        assembler.apply(assemblies: assemblies)
    }
}
