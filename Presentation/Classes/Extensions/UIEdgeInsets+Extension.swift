//
//  UIEdgeInsets+Extension.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 05/05/2021.
//

import UIKit

extension UIEdgeInsets {
    
    init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
    
    var horizontal: CGFloat {
        left
    }
    
    var vertical: CGFloat {
        top
    }
}
