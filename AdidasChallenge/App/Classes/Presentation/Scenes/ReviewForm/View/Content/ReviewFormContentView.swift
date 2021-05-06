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
    private let closeButton: UIButton = .init(type: .close)
    private let titleLabel: UILabel = .init()
    
    private let textLabel: UILabel = .init()
    private let textField: UITextField = .init()
    
    private let ratingLabel: UILabel = .init()
    
    // MARK: - Rating picker
    private let ratingPicker: UIStackView = .init()
    private lazy var ratingViews: [UIButton] = []
    
    /// This offset is used to create a rating.
    /// Example: Tapping on Index 0 will result in 1 star, and so on.
    /// So the offset is used to give index 0 the result of 1 star.
    private let ratingOffset = 1
    
    
    private let submitReviewButton: UIButton = .init(type: .roundedRect)
    private var rating: Int = 0
    
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
            closeButton,
            titleLabel,
            textLabel,
            textField,
            ratingLabel,
            ratingPicker,
            submitReviewButton
        )
        
        setupCloseButton()
        setupTitleLabel()
        setupTextLabel()
        setupTextField()
        setupRatingLabel()
        setupRatingPicker()
        setupSubmitReviewButton()
    }
    
    func setupCloseButton() {
        closeButton.easy.layout(
            Top(24),
            Right(24),
            Size(24)
        )
        closeButton.addTarget(self, action: #selector(didTapClose), for: .touchUpInside)
    }
    
    func setupTitleLabel() {
        titleLabel.easy.layout(
            Top(32),
            Right(48),
            Left(16)
        )
        
        titleLabel.text = "content_detail_add_review_title".localized()
        titleLabel.font = .systemFont(ofSize: 24)
        titleLabel.textColor = .black
    }
    
    func setupTextLabel() {
        textLabel.easy.layout(
            Top(32).to(titleLabel, .bottom),
            Right(48),
            Left().to(titleLabel, .left)
        )
        
        textLabel.text = "review_form_comments_textfield_title".localized()
        textLabel.font = .systemFont(ofSize: 16)
        textLabel.textColor = .black
    }
    
    func setupTextField() {
        textField.easy.layout(
            Top(16).to(textLabel, .bottom),
            Right(48),
            Left().to(titleLabel, .left)
        )
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .done
        textField.placeholder = "review_form_comments_textfield_placeholder_title".localized()
        textField.textColor = .black
    }
    
    func setupRatingLabel() {
        ratingLabel.easy.layout(
            Top(32).to(textField, .bottom),
            Right(48),
            Left().to(titleLabel, .left)
        )
        
        ratingLabel.text = "review_form_rating_title".localized()
        ratingLabel.font = .systemFont(ofSize: 16)
        ratingLabel.textColor = .black
    }
    
    func setupRatingPicker() {
        ratingPicker.easy.layout(
            Top(16).to(ratingLabel, .bottom),
            Right(<=48),
            Left().to(titleLabel, .left)
        )
        
        ratingPicker.axis = .horizontal
        ratingPicker.distribution = .equalCentering
        ratingPicker.spacing = 8
        
        for _ in 1...5 {
            ratingViews.append(.init())
        }
        
        ratingViews.forEach({
            ratingPicker.addArrangedSubview($0)
            $0.easy.layout(Size(24))
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 12
            $0.addTarget(self, action: #selector(didTapRating), for: .touchUpInside)
        })
        
        updateRatingViews()
    }
    
    func setupSubmitReviewButton() {
        submitReviewButton.easy.layout(
            Right(32),
            Bottom(32)
        )
        submitReviewButton.setTitle("review_form_submit_title".localized(), for: .normal)
        submitReviewButton.addTarget(self, action: #selector(didTapSubmitReview), for: .touchUpInside)
    }
}
// MARK: Actions
private extension ReviewFormContentView {
    @objc func didTapClose() {
        delegate?.didTapClose()
    }
    
    @objc func didTapSubmitReview() {
        delegate?.didTapSubmit(text: textField.text ?? "", rating: rating)
    }
    
    @objc func didTapRating(sender: UIButton) {
        guard let index = ratingViews.firstIndex(where: {
            $0 == sender
        }) else {
            return
        }
        
        rating = index + ratingOffset
        updateRatingViews()
    }
}

// MARK: - Update
private extension ReviewFormContentView {
    func updateRatingViews() {
        ratingViews.enumerated().forEach( { index, ratingView in
            ratingView.backgroundColor = rating > index ? .yellow: .lightGray
        })
    }
}
