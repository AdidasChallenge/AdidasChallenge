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
    private var viewModel: ViewModel?
    
    // MARK: - Navigation bar
    private(set) lazy var navigationBar: NavigationBarView = .init(delegate: self)
    
    // MARK: - UIElements
    private let scrollView: UIScrollView = .init(frame: .zero)
    private let contentView: UIView = .init()
    
    private let imageView: UIImageView = .init()
    private let nameLabel: UILabel = .init()
    private let priceLabel: UILabel = .init()
    private let descriptionLabel: UILabel = .init()
    private let reviewList: ReviewContentView = .init()
    private let addReviewButton: UIButton = .init(type: .roundedRect)
    
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
        
        navigationBar.easy.layout(Height(safeAreaInsets.top + navigationBar.navigationBarHeight))
        scrollView.contentInset = UIEdgeInsets(top: navigationBar.frame.maxY, left: 0, bottom: 16, right: 0)
        scrollView.contentOffset = CGPoint(x: 0, y: -navigationBar.frame.maxY)
    }
}

// MARK: - Setup
private extension DetailContentView {
    func setup() {
        backgroundColor = .init(hex: "F1F1F1")
        
        addSubviews(scrollView, navigationBar)
        scrollView.addSubview(contentView)
        setupScrollView()
        
        contentView.addSubviews(
            imageView,
            nameLabel,
            priceLabel,
            descriptionLabel,
            reviewList,
            addReviewButton
        )
        
        setupNavigationBar()
        setupImageView()
        setupNameLabel()
        setupPriceLabel()
        setupDescriptionLabel()
        setupReviewList()
        setupAddReviewButton()
    }
    
    func setupScrollView() {
        scrollView.easy.layout(
            Edges(16)
        )
        
        contentView.easy.layout(
            Edges(),
            Width().like(scrollView)
        )
        
        scrollView.panGestureRecognizer.cancelsTouchesInView = false
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.contentInsetAdjustmentBehavior = .never
        
    }
    
    func setupNavigationBar() {
        navigationBar.easy.layout(
            Top(),
            Left(),
            Right(),
            Height(navigationBar.navigationBarHeight)
        )
    }
    
    func setupImageView() {
        imageView.easy.layout(
            Top(),
            Left(),
            Right(),
            Height().like(imageView, .width)
        )
        imageView.contentMode = .scaleAspectFill
    }
    
    func setupNameLabel() {
        nameLabel.textColor = .black
        
        nameLabel.easy.layout(
            Left(16),
            Top(16).to(imageView, .bottom),
            Width(*0.7).like(imageView)
        )
    }
    
    func setupPriceLabel() {
        priceLabel.textColor = .black
        priceLabel.easy.layout(
            Left().to(nameLabel, .right),
            Top().to(nameLabel, .top),
            Right()
        )
    }
    
    func setupDescriptionLabel() {
        descriptionLabel.textColor = .black
        descriptionLabel.numberOfLines = 3
        
        descriptionLabel.easy.layout(
            Left().to(nameLabel, .left),
            Top(16).to(nameLabel, .bottom),
            Right()
        )
    }
    
    func setupReviewList() {
        reviewList.easy.layout(
            Top(48).to(descriptionLabel, .bottom),
            Left(),
            Height(400),
            Right()
        )
    }
    
    func setupAddReviewButton() {
        addReviewButton.easy.layout(
            Top(16).to(reviewList, .bottom),
            Left(16),
            Height(32),
            Bottom()
        )
        addReviewButton.setTitle("content_detail_add_review_title".localized(), for: .normal)
        addReviewButton.addTarget(self, action: #selector(didTapAddReview), for: .touchUpInside)
        addReviewButton.titleLabel?.font = .systemFont(ofSize: 32)
    }
}

// MARK: Updatable
extension DetailContentView {
    
    func update(model: DetailContentView.ViewModel?) {
        self.viewModel = model
        
        updateImageView()
        updateNameLabel()
        updateDescriptionLabel()
        updatePriceLabel()
    }
    
    private func updateImageView() {
        imageView.downloaded(from: viewModel?.thumbnail ?? "", defaultImage: UIImage(named: "no-image-found-test"))
    }
    
    private func updateNameLabel() {
        nameLabel.text = viewModel?.title
    }
    
    private func updateDescriptionLabel() {
        descriptionLabel.text = viewModel?.description
    }
    
    private func updatePriceLabel() {
        priceLabel.text = viewModel?.price
    }
    
    func updateReviews(viewModel: ReviewContentView.ViewModel) {
        reviewList.update(model: viewModel)
    }
}

// MARK: Actions
private extension DetailContentView {
    @objc func didTapAddReview() {
        delegate?.didTapAddReview()
    }
}

// MARK: NavigationBarDelegate
extension DetailContentView: NavigationBarDelegate {
    func didTapBack() {
        delegate?.didTapBack()
    }
}

