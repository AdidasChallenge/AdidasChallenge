//
//  ReviewCollectionViewCell.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 06/05/2021.
//

import UIKit
import EasyPeasy

final class ReviewCollectionViewCell: UICollectionViewCell, Reusable {

    private let tileView = ReviewTile()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(tileView)
        tileView.easy.layout(
            Edges()
        )
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        
        update(model: nil)
    }
}

// MARK: Updatable
extension ReviewCollectionViewCell {
    func update(model: ReviewTile.ViewModel?) {
        tileView.update(model: model)
    }
}
