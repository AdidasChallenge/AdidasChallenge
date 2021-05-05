//
//  ProductTile+ViewModel.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//

import UIKit

extension ProductTile {
    struct ViewModel: Equatable {
        let thumbnail: String?
        let title: String
        let description: String
        let price: String
    }
}
