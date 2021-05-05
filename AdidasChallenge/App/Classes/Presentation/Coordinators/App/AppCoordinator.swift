//
//  AppCoordinator.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//

import UIKit

public final class AppCoordinator: UIViewController, Coordinator {
    
    var rootViewController: UIViewController? { currentChild ?? self }
    
    private let dependencies: Dependencies
    private var currentCoordinator: Coordinator?
    
    weak var currentChild: UIViewController?
    
    // MARK: Public initializers
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
        
        super.init(nibName: nil, bundle: nil)
        
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setCurrentChild(nextViewController: UIViewController?) {
        guard let nextViewController = nextViewController else { return }
        
        currentChild?.willMove(toParent: nil)
        nextViewController.willMove(toParent: self)
        
        addChild(nextViewController)
        view.addSubview(nextViewController.view)
        nextViewController.didMove(toParent: self)
        
        currentChild?.view.removeFromSuperview()
        currentChild?.removeFromParent()
        
        currentChild = nextViewController
    }
    
    public func start() {
        setCurrentChild(nextViewController: dependencies.launchViewControllerFactory.make(with: self))
    }
}

// MARK: LaunchRoutable
extension AppCoordinator: LaunchRouterDelegate {
    func launchDidComplete() {
        showHome()
    }
    
    private func showHome() {
        let homeCoordinator = dependencies.homeCoordinatorFactory.make()
        homeCoordinator.start()
        setCurrentChild(nextViewController: homeCoordinator.rootViewController)
        
        self.currentCoordinator = homeCoordinator
    }
}

// MARK: - Setup
private extension AppCoordinator {
    func setup() {
        
    }
}
