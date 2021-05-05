//
//  ErrorView.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//

import UIKit
import EasyPeasy

final class ErrorView: UIView {
    
    struct ViewModel {
        let title: String
        let retryAction: (() -> Void)?
        let errorStyle: ErrorStyle
        
        init(title: String, retryAction: (() -> Void)?, errorStyle: ErrorStyle = .normal) {
            self.title = title
            self.retryAction = retryAction
            self.errorStyle = errorStyle
        }
    }
    
    enum ErrorStyle {
        case normal
    }
    
    // MARK: Private properties
    private let containerView = UIView()
    private let titleLabel = UILabel()
    private let retryButton = UIButton(type: .custom)
    
    private var retryAction: (() -> Void)? {
        didSet {
            setLayoutForRetry()
        }
    }
    
    // MARK: Lifecycle
    init() {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Update
extension ErrorView {
    
    func update(model: ViewModel?) {
        titleLabel.text = model?.title
        retryAction = model?.retryAction
        retryButton.isHidden = model?.retryAction == nil
        guard let viewModel = model else { return }
        updateStyle(style: viewModel.errorStyle)
        
    }
    
    private func updateStyle(style: ErrorStyle) {
        switch style {
        case .normal:
            layer.borderColor = UIColor.systemRed.cgColor
            titleLabel.textColor = .systemRed
        }
    }
    
    private func setLayoutForRetry() {
        if retryAction == nil {
            titleLabel.easy.layout(Right(16))
        } else {
            titleLabel.easy.layout(Right(16).to(retryButton, .left))
        }
    }
}

// MARK: - User action
private extension ErrorView {
    
    @objc func retryButtonPressed(_ sender: UIButton) {
        retryAction?()
    }
}

// MARK: - Setup
private extension ErrorView {
    
    func setup() {
        backgroundColor = .white
        clipsToBounds = true
        
        layer.cornerRadius = 4
        layer.borderWidth = 1
        layer.borderColor = UIColor.systemRed.cgColor
        
        setupContainer()
        setupTitleLabel()
        setupRetryButton()
    }
    
    func setupContainer() {
        addSubview(containerView)
        containerView.easy.layout(
            Edges(16)
        )
        
        containerView.addSubviews(titleLabel, retryButton)
    }
    
    func setupTitleLabel() {
        titleLabel.textColor = .systemRed
        titleLabel.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        titleLabel.numberOfLines = 0
        
        titleLabel.easy.layout(
            Left(),
            Top(),
            Right(16).to(retryButton, .left),
            Bottom()
        )
    }
    
    func setupRetryButton() {
        retryButton.tintColor = .lightGray
        retryButton.setTitle("error_row_cta".localized(), for: .normal)
        retryButton.addTarget(self, action: #selector(retryButtonPressed(_:)), for: .touchUpInside)
        retryButton.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
        
        retryButton.easy.layout(
            Top(),
            Right(),
            Bottom()
        )
    }
}
