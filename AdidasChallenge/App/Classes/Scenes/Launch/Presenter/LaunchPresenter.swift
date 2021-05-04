//
//  LaunchPresenter.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//

import Foundation

final class LaunchPresenter {
    
    // MARK: private properties
    private weak var displayLogic: LaunchDisplayLogic?
    
    func setup(with displayLogic: LaunchDisplayLogic?) {
        self.displayLogic = displayLogic
    }
}

// MARK: - Responses
extension LaunchPresenter {
    
}
