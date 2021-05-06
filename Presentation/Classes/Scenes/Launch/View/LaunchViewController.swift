//
//  LaunchViewController.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//

import UIKit

protocol LaunchDisplayLogic: AnyObject {
    
}

// MARK: ViewController
final class LaunchViewController: UIViewController {
    
    // MARK: Internal properties
    
    // MARK: Private properties
    private let interactor: LaunchInteractor
    
    // MARK: Lifecycle
    required init(interactor: LaunchInteractor) {
        self.interactor = interactor
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("\(#function) has not been implemented")
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        interactor.handleInitialize()
        view.backgroundColor = .systemPink
    }
}

// MARK: LaunchDisplayable
extension LaunchViewController: LaunchDisplayLogic {
    
}

// MARK: Private setup methods
private extension LaunchViewController {
    
    func setup() {
        
    }
}
