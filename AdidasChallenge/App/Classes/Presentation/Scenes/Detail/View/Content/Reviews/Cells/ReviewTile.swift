//
//  ReviewTile.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 06/05/2021.
//

import UIKit
import EasyPeasy
import Nuke

final class ReviewTile: UIView {
    
    private var viewModel: ViewModel?
    
    private let textLabel: UILabel = .init()
    private let ratingStackView: UIStackView = .init()
    private lazy var ratingViews: [UIView] = []
    
    init() {
        
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Updatable
extension ReviewTile {
    
    func update(model: ReviewTile.ViewModel?) {
        self.viewModel = model
        
        updateTextLabel()
        updateRating()
    }
    
    func updateTextLabel() {
        textLabel.text = viewModel?.text
    }
    
    func updateRating() {
        let rating = viewModel?.rating ?? 0
        
        ratingViews.enumerated().forEach( { index, ratingView in
            ratingView.backgroundColor = rating > index ? .yellow: .lightGray
        })
    }
}

// MARK: Setup
private extension ReviewTile {
    
    func setup() {
        layer.cornerRadius = 4
        layer.masksToBounds = true
        backgroundColor = .white
        
        addSubviews(textLabel, ratingStackView)
        
        setupTextLabel()
        setupRatingStackView()
    }
    
    func setupTextLabel() {
        textLabel.easy.layout(
            Top(8).to(ratingStackView, .bottom),
            Left(16),
            Right(16),
            Bottom()
        )
        textLabel.numberOfLines = 2
    }
    
    func setupRatingStackView() {
        ratingStackView.easy.layout(
            Top(16),
            Left(16),
            Right(<=16)
        )
        ratingStackView.axis = .horizontal
        ratingStackView.distribution = .equalCentering
        ratingStackView.spacing = 8
        
        for _ in 1...5 {
            ratingViews.append(.init())
        }
        ratingViews.forEach({
            ratingStackView.addArrangedSubview($0)
            $0.easy.layout(Size(24))
            $0.layer.masksToBounds = true
            $0.layer.cornerRadius = 12
        })
    }
}
