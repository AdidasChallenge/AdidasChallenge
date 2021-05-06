//
//  UIButton+Extension.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 05/05/2021.
//

import UIKit

extension UIButton {

    func setImageForAllStates(image: UIImage?) {
        setImage(image, for: .normal)
        setImage(image, for: .selected)
        setImage(image, for: .highlighted)
        setImage(image, for: .focused)
    }
}
