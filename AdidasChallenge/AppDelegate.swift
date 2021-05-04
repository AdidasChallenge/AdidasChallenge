//
//  AppDelegate.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupWindow()
        
        return true
    }
}

// MARK: - Private methods
private extension AppDelegate {
    func setupWindow() {
        
        let factory = applicationDependencies.container.resolve(AppCoordinatorFactory.self)
        let coordinator = factory?.make()
        coordinator?.start()
        
        window?.rootViewController = coordinator
        window?.makeKeyAndVisible()
    }
}


