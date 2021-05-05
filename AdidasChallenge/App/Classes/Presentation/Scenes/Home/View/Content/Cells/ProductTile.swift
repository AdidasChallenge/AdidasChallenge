//
//  ProductTile.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//

import UIKit
import EasyPeasy
import Nuke

final class ProductTile: UIView {
    
    private var viewModel: ViewModel?
    
    private let thumbnailContainer = UIView()
    private let thumbnail = UIImageView()
    
    private let verticalStackView: UIStackView = .init()
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let priceLabel = UILabel()
    
    init() {
        
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Updatable
extension ProductTile {
    
    func update(model: ProductTile.ViewModel?) {
        self.viewModel = model
        
        updateThumbnail()
        updateTitleLabel()
        updateDescriptionLabel()
        updatePriceLabel()
    }
    
    private func updateThumbnail() {
        guard let viewModel = viewModel else {
            thumbnail.image = nil
            return
        }
        
        thumbnail.downloaded(from: viewModel.thumbnail ?? "", defaultImage: UIImage(named: "no-image-found-test"))
    }
    
    private func updateTitleLabel() {
        titleLabel.isHidden = viewModel == nil
        titleLabel.text = viewModel?.title
    }
    
    private func updateDescriptionLabel() {
        descriptionLabel.isHidden = viewModel == nil
        descriptionLabel.text = viewModel?.description
    }
    
    private func updatePriceLabel() {
        priceLabel.isHidden = viewModel == nil
        priceLabel.text = viewModel?.price
    }
    
}

// MARK: Setup
private extension ProductTile {
    private var itemSpacing: CGFloat { 8 }
    
    func setup() {
        backgroundColor = .white
        layer.cornerRadius = 8
        layer.masksToBounds = true
        
        addSubviews(thumbnailContainer, verticalStackView)
        verticalStackView.addArrangedSubviews(titleLabel, descriptionLabel, priceLabel)
        setupThumbnail()
        setupVerticalStackView()
        setupTitleLabel()
        setupDescriptionLabel()
        setupPriceLabel()
    }
    
    func setupThumbnail() {
        thumbnailContainer.layer.cornerRadius = 4
        thumbnailContainer.layer.masksToBounds = true
        
        thumbnailContainer.easy.layout(
            Left(itemSpacing),
            Top(itemSpacing),
            Bottom(itemSpacing),
            Width(*1).like(thumbnailContainer, .height)
        )
        
        thumbnailContainer.addSubview(thumbnail)
        thumbnail.easy.layout(
            Edges()
        )
        thumbnail.contentMode = .scaleAspectFill
    }
    
    func setupVerticalStackView() {
        verticalStackView.easy.layout(
            Left(16).to(thumbnailContainer, .right),
            Right(16),
            Top(>=0).to(thumbnailContainer, .top),
            CenterY()
        )
        
        verticalStackView.axis = .vertical
        verticalStackView.distribution = .equalCentering
        verticalStackView.alignment = .center
        verticalStackView.spacing = 24
    }
    
    func setupTitleLabel() {
        titleLabel.textColor = .black
    }
    
    func setupDescriptionLabel() {
        descriptionLabel.textColor = .black
        descriptionLabel.numberOfLines = 3
    }
    
    func setupPriceLabel() {
        priceLabel.textColor = .black
    }
}
