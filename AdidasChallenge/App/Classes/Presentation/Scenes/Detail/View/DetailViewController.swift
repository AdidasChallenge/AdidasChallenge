//
//  DetailViewController.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//  
//

import UIKit

protocol DetailDisplayLogic: AnyObject {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        interactor.handleInitialize()
        
        navigationController?.navigationBar.isHidden = true
    }
}

// MARK: DetailDisplayLogic
extension DetailViewController: DetailDisplayLogic {
    
}

// MARK: Private setup methods
private extension DetailViewController {
    
    func setup() {
        
    }
}

// MARK: DetailContentViewDelegate
extension DetailViewController: DetailContentViewDelegate {
    func didTapBack() {
        interactor.didTapBack()
    }
}
