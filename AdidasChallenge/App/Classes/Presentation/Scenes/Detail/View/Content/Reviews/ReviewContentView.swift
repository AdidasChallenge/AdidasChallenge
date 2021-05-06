//
//  ReviewContentView.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 06/05/2021.
//

import UIKit
import EasyPeasy

final class ReviewContentView: UIView {
    
    private var viewModel: ViewModel?

    // MARK: - UIElements
    private let titleLabel: UILabel = .init()
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    init() {
        super.init(frame: .zero)
        
        setup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("xibs not supported")
    }
}

// MARK: - Setup
private extension ReviewContentView {
    func setup() {
        backgroundColor = .init(hex: "F1F1F1")
        
        addSubviews(collectionView, titleLabel)
        
        setupCollectionView()
        setupTitleView()
        
    }
    
    func setupCollectionView() {
        collectionView.easy.layout(
            Top().to(titleLabel, .bottom),
            Left(),
            Right(),
            Bottom()
        )
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.registerReusableCell(ReviewCollectionViewCell.self)
        collectionView.alwaysBounceVertical = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    func setupTitleView() {
        titleLabel.easy.layout(
            Top(8),
            Left(16),
            Right(8)
        )
        titleLabel.textColor = .black
    }
    
}

// MARK: Updatable
extension ReviewContentView {
    
    func update(model: ReviewContentView.ViewModel?) {
        self.viewModel = model
        
        updateCollectionView()
        updateTitleLabel()
    }
    
    func updateTitleLabel() {
        titleLabel.text = viewModel?.title
    }
    
    func updateCollectionView() {
        
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension ReviewContentView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //guard let productId = viewModel?.rows[indexPath.row].productId else { return }
        //delegate?.didTapReview(productId: productId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.rows.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: ReviewCollectionViewCell = collectionView.dequeueReusableCell(indexPath: indexPath)
        guard let viewModel = viewModel, indexPath.row < viewModel.rows.count else {
            return UICollectionViewCell()
        }
        
        cell.update(model: viewModel.rows[indexPath.row])
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ReviewContentView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width - 32, height: 100)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(horizontal: 0, vertical: 8)
    }
}
