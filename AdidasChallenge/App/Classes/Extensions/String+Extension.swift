//
//  String+Extension.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//

import Foundation

public extension String {
    func localized() -> String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}
