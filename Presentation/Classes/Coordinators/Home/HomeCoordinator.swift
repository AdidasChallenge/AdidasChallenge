//
//  HomeCoordinator.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//

import UIKit
import Domain

final class HomeCoordinator: Coordinator {
    
    private let dependencies: Dependencies
    weak var rootViewController: UIViewController?
    private var navigationController: UINavigationController?
    private var childCoordinator: Coordinator?
    
    private var completion: (() -> Void)?
    
    init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    func start() {
        let homeVC = dependencies.homeViewControllerFactory.make(with: self)
        
        let navigationController = NavigationController(rootViewController: homeVC)
        
        rootViewController = navigationController
        
    }
    
    deinit {
        rootViewController = nil
    }
}

// MARK: LaunchRoutable
extension HomeCoordinator: HomeRouterDelegate {
    func showDetail(product: Product) {
        guard let navigationController = rootViewController as? NavigationController else { return }
        
        var detailVC: UIViewController
        detailVC = dependencies.detailViewControllerFactory.make(with: self, product: product)
        
        navigationController.pushViewController(detailVC, animated: true)
    }
}

// MARK: LaunchRoutable
extension HomeCoordinator: DetailRouterDelegate {
    func addReview(productId: String, completion: (() -> Void)?) {
        self.completion = completion
        
        guard let navigationController = rootViewController as? NavigationController else { return }
        
        var formVC: UIViewController
        formVC = dependencies.reviewFormViewControllerFactory.make(with: self, productId: productId)
        
        formVC.modalPresentationStyle = .formSheet
        
        navigationController.present(formVC, animated: true)
    }
    
    func dismissDetail() {
        guard let navigationController = rootViewController as? NavigationController else { return }
        
        navigationController.popViewController(animated: true)
    }
}

// MARK: LaunchRoutable
extension HomeCoordinator: ReviewFormRouterDelegate {
    func submitReviewForm() {
        
        completion?()
        completion = nil
        dismissReviewForm()
    }
    
    func dismissReviewForm() {
        guard let navigationController = rootViewController as? NavigationController else { return }
        
        navigationController.dismiss(animated: true)
    }
}
