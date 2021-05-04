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
    weak var delegate: HomeContentViewDelegate?
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
    private let loadingAnimation = AnimationView(name: "loading-spinner")
    

    // MARK: UIElements
    init(delegate: HomeContentViewDelegate) {
        self.delegate = delegate
        
        super.init(frame: .zero)
        
        setup()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("xibs not supported")
    }
}
// MARK: - Setup
private extension HomeContentView {
    func setup() {
        backgroundColor = .systemPink
        
        setupContent()
    }
    
    func setupContent() {
        addSubview(collectionView)
        
        setupCollectionView()
    }
}

// MARK: - Content
private extension HomeContentView {
    func setupCollectionView() {
        
        collectionView.backgroundColor = .clear
        collectionView.registerReusableCell(ProductCollectionViewCell.self)
        collectionView.alwaysBounceVertical = false
        collectionView.easy.layout(
            Top(),
            Left(),
            Right(),
            Bottom()
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
