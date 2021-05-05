//
//  SearchBarView.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 05/05/2021.
//

import UIKit
import EasyPeasy

final class SearchBarView: UIView {
    
    // MARK: Private properties
    private let searchImageView = UIImageView()
    private let cancelSearchBarButton = UIButton()
    private let cancelSearchTextButton = UIButton()
    private let searchBarView = UIView()
    
    private(set) var searchTextField = SearchTextField()
    
    weak var delegate: SearchBarViewDelegate?
    
    // MARK: Lifecycle
    init() {
        super.init(frame: .zero)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
}

// MARK: - Private Setup methods
private extension SearchBarView {
    func setup() {
        addSubviews(searchBarView, cancelSearchTextButton)

        setupSearchBar()
        setupCancelTextButton()
        setupSearchImageView()
        setupSearchTextField()
        setupCancelSearchBarButton()
    }
    
    func setupCancelTextButton() {
        
        cancelSearchTextButton.alpha = 0
        cancelSearchTextButton.setTitle("search_input_cancel".localized(), for: .normal)
        cancelSearchTextButton.setTitleColor(.systemBlue, for: .normal)
        cancelSearchTextButton.addTarget(self, action: #selector(cancelTextButtonDidTap), for: .touchUpInside)
        cancelSearchTextButton.isHidden = true
        cancelSearchTextButton.easy.layout(
            Top(),
            Right(),
            Bottom()
        )
    }
    
    func setupSearchBar() {
        searchBarView.addSubviews(searchTextField, searchImageView, cancelSearchBarButton)
        searchBarView.layer.cornerRadius = 20
        searchBarView.layer.masksToBounds = true
        searchBarView.backgroundColor = .white
        searchBarView.easy.layout(
            Edges()
        )
    }
    
    func setupSearchImageView() {
        searchImageView.easy.layout(
            Left(16),
            CenterY(),
            Height(16),
            Width(16)
        )
        searchImageView.contentMode = .scaleAspectFit
        searchImageView.image = UIImage(named: "search-icon")?.withRenderingMode(.alwaysTemplate)
        searchImageView.tintColor = .systemBlue
    }
    
    func setupSearchTextField() {
        searchTextField.easy.layout(
            Left(),
            Top(),
            Bottom(),
            Right()
        )
        searchTextField.delegate = self
        searchTextField.tintColor = .systemBlue
        searchTextField.textColor = .black
        searchTextField.attributedPlaceholder = NSAttributedString(string: "search_input_placeholder".localized(),
                                                                   attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray]
        )
        searchTextField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)

        searchTextField.returnKeyType = .search
    }
    
    func setupCancelSearchBarButton() {
        cancelSearchBarButton.easy.layout(
            CenterY(),
            Size(20),
            Right(8)
        )
        cancelSearchBarButton.alpha = 0
        cancelSearchBarButton.addTarget(self, action: #selector(cancelSearchBarButtonDidTap), for: .touchUpInside)
        
        cancelSearchBarButton.imageView?.tintColor = .systemBlue
        cancelSearchBarButton.setImageForAllStates(image: UIImage(named: "close-search")?.withRenderingMode(.alwaysTemplate))
        cancelSearchBarButton.imageView?.backgroundColor = .clear
        
        cancelSearchBarButton.layer.cornerRadius = 10
        cancelSearchBarButton.layer.masksToBounds = true
    }
}

// MARK: - Actions
extension SearchBarView {
    @objc func cancelSearchBarButtonDidTap() {
        searchTextField.text = nil
        searchTextField.becomeFirstResponder()
        simpleAnimateView(shouldShow: false, view: cancelSearchBarButton)
        textFieldDidChange(searchTextField)
    }
    
    @objc func cancelTextButtonDidTap() {
        searchTextField.text = nil
        resignResponder()
        simpleAnimateView(shouldShow: false, view: cancelSearchBarButton)
        delegate?.didTapCancelSearch()
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        delegate?.searchBarTextDidChange(text: textField.text ?? "")
        
        guard textField.text != nil, !(textField.text?.isEmpty ?? true) else {
            simpleAnimateView(shouldShow: false, view: cancelSearchBarButton)
            return
        }
        
        if cancelSearchBarButton.alpha == 0 {
            simpleAnimateView(shouldShow: true, view: cancelSearchBarButton)
        }
    }
}

// MARK: - Internal methods
extension SearchBarView {
    func resignResponder() {
        searchTextField.resignFirstResponder()
    }
    
    func focusInput() {
        searchTextField.becomeFirstResponder()
    }
}

// MARK: - Private methods
extension SearchBarView {
    func simpleAnimateView(shouldShow: Bool, view: UIView) {
        let alpha: CGFloat = shouldShow ? 1 : 0
        
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            options: .curveEaseOut,
            animations: {
                view.alpha = alpha
        },
            completion: nil)
    }
    
    func simpleAnimateCancelView(shouldShow: Bool, view: UIView) {
        let alpha: CGFloat = shouldShow ? 1 : 0
        view.isHidden = shouldShow ? false : true
        cancelSearchTextButton.easy.clear()
        
        UIView.animate(
            withDuration: 0.2,
            delay: 0,
            options: .curveEaseOut,
            animations: {
                guard shouldShow else {
                    self.searchBarView.easy.layout(Right())
                    return
                }
                
                self.cancelSearchTextButton.easy.layout(
                    Top(),
                    Right(),
                    Bottom(),
                    Width(==self.cancelSearchTextButton.intrinsicContentSize.width)
                )
                self.searchBarView.easy.layout(Right(16).to(self.cancelSearchTextButton, .left))
                
                view.alpha = alpha
        },
            completion: nil)
    }
}

// MARK: - UITextFieldDelegate
extension SearchBarView: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        simpleAnimateCancelView(shouldShow: true, view: cancelSearchTextButton)
        
        guard textField.text != nil, !(textField.text?.isEmpty ?? true) else {
            simpleAnimateView(shouldShow: false, view: cancelSearchBarButton)
            return
        }
        simpleAnimateView(shouldShow: true, view: cancelSearchBarButton)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        simpleAnimateCancelView(shouldShow: false, view: cancelSearchTextButton)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        resignResponder()
        return true
    }
}
