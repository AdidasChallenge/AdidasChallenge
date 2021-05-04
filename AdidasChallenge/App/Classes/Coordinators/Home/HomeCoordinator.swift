//
//  HomeCoordinator.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//

import UIKit

final class HomeCoordinator: Coordinator {
    
    private let dependencies: Dependencies
    weak var rootViewController: UIViewController?
    private var navigationController: UINavigationController?
    private var childCoordinator: Coordinator?
    
    init(dependencies: Dependencies, rootViewController: UIViewController) {
        self.dependencies = dependencies
        self.rootViewController = rootViewController
    }
    
    func start() {
        guard let navigationController = rootViewController as? NavigationController else { return }
        
        var loginVC: UIViewController
        loginVC = dependencies.homeViewControllerFactory.make(with: self)
        
        navigationController.pushViewController(loginVC, animated: true)
    }
}

// MARK: LaunchRoutable
extension HomeCoordinator: HomeRouterDelegate {
    func showDetail() {
        
    }
}
