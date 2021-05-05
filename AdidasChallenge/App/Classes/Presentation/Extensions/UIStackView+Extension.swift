//
//  UIStackView+Extension.swift
//  Pods
//
//  Created by Kevin van den Hoek on 01/11/2019.
//

import UIKit

@available(iOS 9.0, *)
public extension UIStackView {
    
    /// Adds given subviews in the given order
    func addArrangedSubviews(_ subviews: UIView...) {
        subviews.forEach({ addArrangedSubview($0) })
    }
    
    /// Adds given subviews in the given order
    func addArrangedSubviews(_ subviews: [UIView]) {
        subviews.forEach({ addArrangedSubview($0) })
    }
    
    /**
     Removes (all) arranged subviews of a stackview (depending on your implementation of the 'where' parameter)
     - Parameter where: callback where you can return whether or not a subview must be removed, leave nil to simply remove all subviews
     */
    func removeArrangedSubviews(where shouldRemove: ((UIView) -> Bool)? = nil) {
        arrangedSubviews.forEach({
            guard shouldRemove == nil || shouldRemove?($0) == true else { return }
            removeArrangedSubview($0)
            $0.removeFromSuperview()
        })
    }
    
    /// Removes all previous arranged subviews and adds all newly given arranged subviews
    func set(arrangedSubviews newArrangedSubviews: [UIView]) {
        removeArrangedSubviews()
        addArrangedSubviews(newArrangedSubviews)
    }
}
