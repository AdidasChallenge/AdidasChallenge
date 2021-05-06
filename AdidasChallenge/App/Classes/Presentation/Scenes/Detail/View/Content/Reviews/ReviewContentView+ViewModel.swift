//
//  ReviewContentView+ViewModel.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 06/05/2021.
//

import Foundation

extension ReviewContentView {
    struct ViewModel {
        let title: String
        let rows: [ReviewTile.ViewModel]
    }
}
