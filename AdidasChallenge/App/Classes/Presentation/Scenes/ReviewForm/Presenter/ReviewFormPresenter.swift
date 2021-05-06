//
//  ReviewFormPresenter.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//  
//

import Foundation

final class ReviewFormPresenter {
    
    // MARK: private properties
    private weak var displayLogic: ReviewFormDisplayLogic?
    
    init() {
        
    }
    
    func setup(with displayLogic: ReviewFormDisplayLogic?) {
        self.displayLogic = displayLogic
    }
}

// MARK: - Responses
extension ReviewFormPresenter {
}
