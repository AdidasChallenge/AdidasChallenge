//
//  SearchTextField.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 05/05/2021.
//

import UIKit

final class SearchTextField: UITextField {
    let leftInset: CGFloat = 48
    let rightInset: CGFloat = 32

    // placeholder position
    override func textRect(forBounds bounds: CGRect) -> CGRect {
       getInsetRect(bounds: bounds)
    }

    // text position
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        getInsetRect(bounds: bounds)
    }

    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        getInsetRect(bounds: bounds)
    }
}

// MARK: - Private methods
private extension SearchTextField {
    func getInsetRect(bounds: CGRect) -> CGRect {
        return CGRect(x: bounds.minX + leftInset, y: bounds.minY, width: bounds.width - leftInset - rightInset, height: bounds.height)
    }
}
