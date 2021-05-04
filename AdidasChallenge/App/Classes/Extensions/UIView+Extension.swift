//
//  UIView+Extension.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//

import UIKit

extension UIView {
    
    /// Returns frame size height
    var height: CGFloat {
        get {
            return frame.size.height
        }
        set (height) {
            frame.size.height = height
        }
    }
    
    /// Returns frame size width
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set (width) {
            frame.size.width = width
        }
    }
    
    /// Returns frame origin x
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set (x) {
            frame.origin.x = x
        }
    }
    
    /// Returns frame origin y
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set (y) {
            frame.origin.y = y
        }
    }
    
    /// Applies dropshadow to the UIView
    func applyDropShadow() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 3)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 2
    }
    
    // This can be used on optional views to send them to back
    func sendToBack(){
        superview?.sendSubviewToBack(self)
    }
    
    // This can be used on optional views to send them to back
    func bringToFront(){
        superview?.bringSubviewToFront(self)
    }
    
    /// Adds an array of subviews in the given order
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach({ addSubview($0) })
    }
    
    /// Adds an array of subviews in the given order
    func addSubviews(_ subviews: [UIView]) {
        subviews.forEach({ addSubview($0) })
    }
}
