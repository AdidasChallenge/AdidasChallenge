//
//  HomeViewController.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//  
//

import UIKit

protocol HomeDisplayLogic: AnyObject {
    func displayProducts(tiles: [ProductTile.ViewModel])
    func displayLoading(display: Bool)
    func displayErrorView(viewModel: ErrorView.ViewModel)
}

// MARK: ViewController
final class HomeViewController: UIViewController {
    
    // MARK: Private properties
    private let interactor: HomeInteractor
    private let contentView = HomeContentView()
    
    private(set) var productTiles: [ProductTile.ViewModel]?
    
    // MARK: Lifecycle
    required init(interactor: HomeInteractor) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: Bundle(for: type(of: self)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("\(#function) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        interactor.handleInitialize()
    }
}

// MARK: HomeDisplayLogic
extension HomeViewController: HomeDisplayLogic {
    func displayErrorView(viewModel: ErrorView.ViewModel) {
        contentView.errorView.update(model: viewModel)
        contentView.errorView.isHidden = false
        displayLoading(display: false)
    }
    
    func displayProducts(tiles: [ProductTile.ViewModel]) {
        contentView.errorView.isHidden = true
        displayLoading(display: false)
        productTiles = tiles
        contentView.reloadData()
    }
    
    func displayLoading(display: Bool) {
        contentView.displayLoading(display: display)
    }
}

// MARK: Private setup methods
private extension HomeViewController {
    
    func setup() {
        contentView.collectionViewDataSource = self
        contentView.collectionViewDelegateFlowLayout = self
        contentView.searchBarView.delegate = self
    }
}

// MARK: - UICollectionViewDataSource
extension HomeViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let productId = productTiles?[indexPath.row].id else { return }
        interactor.didTapProduct(productId: productId)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productTiles?.count ?? 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
        let cell: ProductCollectionViewCell = collectionView.dequeueReusableCell(indexPath: indexPath)
        guard let productTiles = productTiles, indexPath.row < productTiles.count else {
            return UICollectionViewCell()
        }
        
        cell.update(model: productTiles[indexPath.row])
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width - 32, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(horizontal: 0, vertical: 16)
    }
}

// MARK: - SearchBarViewDelegate
extension HomeViewController: SearchBarViewDelegate {
    func didTapCancelSearch() {
        interactor.searchTextDidChange(searchTerm: "")
    }
    
    func searchBarTextDidChange(text: String) {
        interactor.searchTextDidChange(searchTerm: text)
    }
}
