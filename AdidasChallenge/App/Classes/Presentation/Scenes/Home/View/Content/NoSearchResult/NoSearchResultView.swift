//
//  NoSearchResultView.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//

import UIKit
import EasyPeasy

final class NoSearchResultView: UIView {
    
    private let titleLabel = UILabel()
    private let descriptionLabel = UILabel()
    
    init() {
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Updatable
extension NoSearchResultView {
    func update(model: ViewModel?) {
        guard let viewModel = model else { return }
        updateTitleLabel(searchTitle: viewModel.searchTerm)
    }
}

// MARK: Private updates
private extension NoSearchResultView {
    func updateTitleLabel(searchTitle: String) {
        titleLabel.text = String(format: "search_no_result_title", searchTitle.uppercased())
    }
}

// MARK: Setup
private extension NoSearchResultView {
    
    func setup() {
        addSubviews(titleLabel, descriptionLabel)
        setupTitleLabel()
        setupDescriptionLabel()
    }
    
    func setupTitleLabel() {
        titleLabel.textColor = .lightGray
        titleLabel.numberOfLines = 3
        titleLabel.textAlignment = .center
        
        titleLabel.easy.layout(
            Top(),
            Left(),
            Right()
        )
    }
    
    func setupDescriptionLabel() {
        descriptionLabel.textColor = .lightGray
        descriptionLabel.text = "search_no_result_description".localized()
        descriptionLabel.numberOfLines = 3
        descriptionLabel.textAlignment = .center
        
        descriptionLabel.easy.layout(
            Top(8).to(titleLabel, .bottom),
            Left(),
            Right(),
            Bottom()
        )
    }
}
