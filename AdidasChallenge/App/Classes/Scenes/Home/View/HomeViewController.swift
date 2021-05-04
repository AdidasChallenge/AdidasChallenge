//
//  HomeViewController.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//  
//

import UIKit

protocol HomeDisplayLogic: AnyObject {
    
}

// MARK: ViewController
final class HomeViewController: UIViewController {
    
    // MARK: Internal properties
    private lazy var contentView = HomeContentView(delegate: self)
    
    // MARK: Private properties
    private let interactor: HomeInteractor
    
    // MARK: Lifecycle
    required init(interactor: HomeInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("\(#function) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
        interactor.handleInitialize()
    }
}

// MARK: HomeDisplayLogic
extension HomeViewController: HomeDisplayLogic {
    
}

// MARK: Private setup methods
private extension HomeViewController {
    
    func setup() {
        
    }
}

// MARK: HomeContentViewDelegate
extension HomeViewController: HomeContentViewDelegate {
    
}
