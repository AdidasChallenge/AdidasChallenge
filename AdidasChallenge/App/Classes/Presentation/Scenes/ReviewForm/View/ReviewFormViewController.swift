//
//  ReviewFormViewController.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//  
//

import UIKit

protocol ReviewFormDisplayLogic: AnyObject {
    func displayAlert(type: ResponseType)
}

// MARK: ViewController
final class ReviewFormViewController: UIViewController {
    
    // MARK: Private properties
    private let interactor: ReviewFormInteractor
    
    private lazy var contentView = ReviewFormContentView(delegate: self)
    
    // MARK: Lifecycle
    required init(interactor: ReviewFormInteractor) {
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

// MARK: ReviewFormDisplayLogic
extension ReviewFormViewController: ReviewFormDisplayLogic {
    func displayAlert(type: ResponseType) {
        
        let alert = UIAlertController(title: type.title, message: type.description.localized(), preferredStyle: UIAlertController.Style.alert)
        
        alert.addAction(UIAlertAction(title: "search_error_cancel".localized(), style: UIAlertAction.Style.cancel, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: ReviewFormContentViewDelegate
extension ReviewFormViewController: ReviewFormContentViewDelegate {
    func didTapClose() {
        interactor.closeReview()
    }
    
    func didTapSubmit(text: String, rating: Int) {
        resignFirstResponder()
        interactor.submitReview(text: text, rating: rating)
    }
}
