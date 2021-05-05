//
//  DetailPresenter.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//  
//

import Foundation

final class DetailPresenter {
    
    // MARK: private properties
    private weak var displayLogic: DetailDisplayLogic?
    init() {
        
    }
    
    func setup(with displayLogic: DetailDisplayLogic?) {
        self.displayLogic = displayLogic
    }
}

// MARK: - Responses
extension DetailPresenter {
}
