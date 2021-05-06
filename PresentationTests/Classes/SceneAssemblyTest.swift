//
//  HomeViewControllerAssemblyTest.swift
//  PresentationTests
//
//  Created by Jesse Klijn on 07/05/2021.
//

import XCTest
import Swinject
@testable import Presentation

final class SceneAssemblyTest: XCTestCase {

    private var container: Container!
    private lazy var assembler = Assembler(container: container)
    
    override func setUp() {
        container = Container()
        
        assembler.apply(assembly: TargetAssembly())
    }
    
    override func tearDown() {
        container = nil
    }
}

// MARK: - Test
extension SceneAssemblyTest {
    
    func test_resolve_HomeViewControllerFactory_shouldInit() {
        // given, when
        let sut = container.resolve(HomeViewControllerFactory.self)
        
        // then
        XCTAssertNotNil(sut)
    }
    
    func test_resolve_LaunchViewControllerFactory_shouldInit() {
        // given, when
        let sut = container.resolve(LaunchViewControllerFactory.self)
        
        // then
        XCTAssertNotNil(sut)
    }
    
    func test_resolve_DetailViewControllerFactory_shouldInit() {
        // given, when
        let sut = container.resolve(DetailViewControllerFactory.self)
        
        // then
        XCTAssertNotNil(sut)
    }
    
    func test_resolve_ReviewFormViewControllerFactory_shouldInit() {
        // given, when
        let sut = container.resolve(ReviewFormViewControllerFactory.self)
        
        // then
        XCTAssertNotNil(sut)
    }
}
