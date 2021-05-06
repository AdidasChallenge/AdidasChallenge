//
//  DetailContentView.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//

import UIKit
import EasyPeasy

final class DetailContentView: UIView {
    
    private weak var delegate: DetailContentViewDelegate?
    private(set) lazy var navigationBar: NavigationBarView = .init(delegate: self)
    
    init(delegate: DetailContentViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        
        setup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("xibs not supported")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        navigationBar.easy.layout(Top(max(safeAreaInsets.top, 44)))
    }
}

// MARK: - Setup
private extension DetailContentView {
    func setup() {
        backgroundColor = .init(hex: "F1F1F1")
        
        addSubviews(navigationBar)
        
        setupNavigationBar()
    }
    
    func setupNavigationBar() {
        navigationBar.easy.layout(
            Top(),
            Left(),
            Right(),
            Height(44)
        )
    }
}

// MARK: - Content
private extension DetailContentView {
    
}

// MARK: - Internal methods
extension DetailContentView {
    
}

// MARK: - Private methods
private extension DetailContentView {
    
}

// MARK: Actions
private extension DetailContentView {
    
}

// MARK: NavigationBarDelegate
extension DetailContentView: NavigationBarDelegate {
    func didTapBack() {
        delegate?.didTapBack()
    }
}
