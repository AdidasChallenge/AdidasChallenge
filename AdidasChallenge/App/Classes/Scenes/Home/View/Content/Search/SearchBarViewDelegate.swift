//
//  SearchBarViewDelegate.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 05/05/2021.
//

import Foundation

protocol SearchBarViewDelegate: AnyObject {
    func didTapCancelSearch()
    func searchBarTextDidChange(text: String)
}
