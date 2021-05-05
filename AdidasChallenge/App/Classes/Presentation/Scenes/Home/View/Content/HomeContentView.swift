//
//  HomeContentView.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//

import UIKit
import EasyPeasy
import Lottie

final class HomeContentView: UIView {
    
    // MARK: Internal
    weak var collectionViewDataSource: UICollectionViewDataSource? {
        didSet {
            collectionView.dataSource = collectionViewDataSource
        }
    }
    weak var collectionViewDelegateFlowLayout: UICollectionViewDelegateFlowLayout? {
        didSet {
            collectionView.delegate = collectionViewDelegateFlowLayout
        }
    }
    
    // MARK: UIElements
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    private(set) var errorView = ErrorView()
    private(set) var noResultView = NoSearchResultView()
    private(set) var searchBarView = SearchBarView()
    
    private let loadingAnimation = AnimationView(name: "loading-spinner")

    init() {
        super.init(frame: .zero)
        
        setup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("xibs not supported")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        searchBarView.easy.layout(Top(max(safeAreaInsets.top, 44)))
    }
}

// MARK: - Setup
private extension HomeContentView {
    func setup() {
        backgroundColor = .init(hex: "F1F1F1")
        
        setupContent()
    }
    
    func setupContent() {
        addSubviews(searchBarView, collectionView, errorView, loadingAnimation, noResultView)

        setupCollectionView()
        setupLoadingAnimation()
        setupSearchBarView()
        setupTapGesture()
        setupErrorView()
        setupNoResultView()
    }
}

// MARK: - Content
private extension HomeContentView {
    func setupCollectionView() {
        
        collectionView.backgroundColor = .clear
        collectionView.registerReusableCell(ProductCollectionViewCell.self)
        collectionView.alwaysBounceVertical = false
        collectionView.easy.layout(
            Top(8).to(searchBarView, .bottom),
            Left(),
            Right(),
            Bottom()
        )
    }
    
    func setupSearchBarView() {
        searchBarView.easy.layout(
            Left(8),
            Right(16),
            Top(),
            Height(44)
        )
    }
    
    func setupLoadingAnimation() {
        loadingAnimation.backgroundColor = .clear
        loadingAnimation.isHidden = true
        loadingAnimation.contentMode = .scaleAspectFit
        loadingAnimation.loopMode = .loop
        loadingAnimation.layer.cornerRadius = 16
        
        loadingAnimation.easy.layout(Center(),
                                     Size(92))
    }
    
    func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(didTapElsewhere))
        tapGesture.cancelsTouchesInView = false
        addGestureRecognizer(tapGesture)
    }
    
    func setupErrorView() {
        errorView.isHidden = true
        errorView.easy.layout(
            Left(>=8),
            Right(<=8),
            CenterX().with(.high),
            Bottom(24)
        )
    }

    func setupNoResultView() {
        noResultView.isHidden = true
        noResultView.easy.layout(
            Left(16),
            Right(16),
            CenterY()
        )
    }
    
}

// MARK: - Internal methods
extension HomeContentView {
    func reloadData() {
        updateCollectionView()
    }
    
    func displayLoading(display: Bool) {
        loadingAnimation.isHidden = display ? false: true
        display ? loadingAnimation.play(): loadingAnimation.stop()
    }
}

// MARK: - Private methods
private extension HomeContentView {
    func updateCollectionView() {
        collectionView.reloadData()
    }
}

// MARK: Actions
private extension HomeContentView {
    @objc func didTapElsewhere() {
        searchBarView.resignResponder()
    }
}
