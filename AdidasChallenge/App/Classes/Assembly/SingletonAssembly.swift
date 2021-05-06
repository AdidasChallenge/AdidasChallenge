//
//  SingletonAssembly.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//

import Foundation
import Swinject
import SwinjectAutoregistration

final class SingletonAssembly: Assembly {
    
    // MARK: Internal methods
    func assemble(container: Container) {
        container.register(AppDelegate.self, factory: { resolver in resolver.resolve(UIApplication.self)?.delegate as! AppDelegate })
        container.register(UIScreen.self, factory: { _ in return UIScreen.main })
        container.register(UIWindow.self, factory: { resolver in UIWindow(frame: resolver.resolve(UIScreen.self)!.bounds) }).inObjectScope(.container)
        container.register(UIApplication.self, factory: { _ in UIApplication.shared })
        container.register(UserDefaults.self, factory: { _ in UserDefaults.standard })
    }
}
