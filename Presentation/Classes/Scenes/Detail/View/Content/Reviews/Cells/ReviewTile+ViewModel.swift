//
//  ReviewTile+ViewModel.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 06/05/2021.
//

import UIKit

extension ReviewTile {
    struct ViewModel: Equatable {
        let productId: String
        let locale: String
        let text: String
        let rating: Int
    }
}
