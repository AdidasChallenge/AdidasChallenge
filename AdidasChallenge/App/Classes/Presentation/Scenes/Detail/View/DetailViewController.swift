//
//  DetailViewController.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//  
//

import UIKit

protocol DetailDisplayLogic: AnyObject {
    func presentDetail(viewModel: DetailContentView.ViewModel)
    func presentReviews(viewModel: ReviewContentView.ViewModel)
    func presentError(retryAction: (() -> Void)?)
}

// MARK: ViewController
final class DetailViewController: UIViewController {
    
    // MARK: Private properties
    private let interactor: DetailInteractor
    
    private lazy var contentView = DetailContentView(delegate: self)
    
    private(set) var productTiles: [ProductTile.ViewModel]?
    
    // MARK: Lifecycle
    required init(interactor: DetailInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("\(#function) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        interactor.handleInitialize()
    }
}

// MARK: DetailDisplayLogic
extension DetailViewController: DetailDisplayLogic {
    func presentDetail(viewModel: DetailContentView.ViewModel) {
        contentView.update(model: viewModel)
    }
    
    func presentReviews(viewModel: ReviewContentView.ViewModel) {
        contentView.updateReviews(viewModel: viewModel)
    }
    
    func presentError(retryAction: (() -> Void)?) {
        let alert = UIAlertController(title: "detail_alert_error_title".localized(), message: "detail_alert_error_description".localized(), preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "search_error_cta".localized(), style: UIAlertAction.Style.default, handler: { _ in
            retryAction?()
        }))
        alert.addAction(UIAlertAction(title: "search_error_cancel".localized(), style: UIAlertAction.Style.cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: DetailContentViewDelegate
extension DetailViewController: DetailContentViewDelegate {
    func didTapAddReview() {
        interactor.addReview()
    }
    
    func didTapBack() {
        interactor.didTapBack()
    }
}
