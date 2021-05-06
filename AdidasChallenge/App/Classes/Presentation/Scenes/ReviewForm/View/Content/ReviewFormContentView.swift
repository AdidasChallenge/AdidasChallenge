//
//  ReviewFormContentView.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//

import UIKit
import EasyPeasy

final class ReviewFormContentView: UIView {
    
    private weak var delegate: ReviewFormContentViewDelegate?
    
    // MARK: - UIElements
    private let submitReviewButton: UIButton = .init(type: .roundedRect)
    
    init(delegate: ReviewFormContentViewDelegate) {
        self.delegate = delegate
        super.init(frame: .zero)
        
        setup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("xibs not supported")
    }
}

// MARK: - Setup
private extension ReviewFormContentView {
    func setup() {
        backgroundColor = .init(hex: "F1F1F1")
        
        addSubviews(
            submitReviewButton
        )
        
        setupSubmitReviewButton()
    }
    
    
    func setupSubmitReviewButton() {
        submitReviewButton.easy.layout(
            Left(16),
            Bottom(16)
        )
        submitReviewButton.setTitle("content_ReviewForm_add_review_title".localized(), for: .normal)
        submitReviewButton.addTarget(self, action: #selector(didTapSubmitReview), for: .touchUpInside)
    }
}
// MARK: Actions
private extension ReviewFormContentView {
    @objc func didTapSubmitReview() {
        delegate?.didTapSubmit()
    }
}

