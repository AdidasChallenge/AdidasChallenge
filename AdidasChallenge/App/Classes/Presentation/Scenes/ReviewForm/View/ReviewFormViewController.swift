//
//  ReviewFormViewController.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//  
//

import UIKit

protocol ReviewFormDisplayLogic: AnyObject {
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
    
}

// MARK: ReviewFormContentViewDelegate
extension ReviewFormViewController: ReviewFormContentViewDelegate {
    func didTapSubmit() {
        interactor.submitReview()
    }
}
