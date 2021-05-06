//
//  NavigationBarView.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 06/05/2021.
//

import UIKit
import EasyPeasy

final class NavigationBarView: UIView {
    
    private weak var delegate: NavigationBarDelegate?
    
    // MARK: UIElements
    private let backButton: UIButton = .init(type: .custom)
    
    init(delegate: NavigationBarDelegate) {
        self.delegate = delegate
        
        super.init(frame: .zero)
        
        setup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("xibs not supported")
    }
}

// MARK: - Setup
private extension NavigationBarView {
    func setup() {
        backgroundColor = .init(hex: "F1F1F1")
        
        addSubview(backButton)
        
        setupBackButton()
    }
}

// MARK: - Content
private extension NavigationBarView {
    func setupBackButton() {
        backButton.easy.layout(
            Left(16),
            CenterY(),
            Size(32)
        )
        
        let image = UIImage(named: "back")?.withRenderingMode(.alwaysTemplate)
        backButton.setImage(image, for: .normal)
        backButton.setImage(image, for: .selected)
        backButton.setImage(image, for: .highlighted)
        backButton.imageView?.contentMode = .center
        backButton.tintColor = .black
        backButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
    }
}

// MARK: Actions
private extension NavigationBarView {
    @objc func didTapBack() {
        delegate?.didTapBack()
    }
}
