//
//  HomeInteractor.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//  
//

final class HomeInteractor {
    
    // MARK: Private properties
    private var presenter: HomePresenter?
    private var router: HomeRouterDelegate?
    private let productWorker: ProductWorker
    
    private var searchTerm: String = ""
    
    private var products: [Product]?
    
    // MARK: Lifecycle
    init(productWorker: ProductWorker) {
        self.productWorker = productWorker
    }
    
    // MARK: Internal methods
    func setup(with presenter: HomePresenter, router: HomeRouterDelegate) {
        self.presenter = presenter
        self.router = router
    }
}

// MARK: - Requests
extension HomeInteractor {
    
    func handleInitialize() {
        getProducts(searchTerm: searchTerm)
    }
    
    func didTapProduct(productId: String) {
        guard let products = products,
              let product = products.first(where: {
                $0.id == productId
              }) else {
            return
        }
        
        router?.showDetail(product: product)
    }
    
    func searchTextDidChange(searchTerm: String) {
        self.searchTerm = searchTerm
        getProducts(searchTerm: searchTerm)
    }
}

// MARK: - Products
private extension HomeInteractor {
    func getProducts(searchTerm: String) {
        presenter?.presentLoading(display: true)
        productWorker.getProducts(searchTerm: searchTerm, completion: { [weak self] response in
            switch response {
            case .success(let products):
                self?.products = products
                self?.presenter?.presentProducts(products: products)
            case .failure:
                self?.presenter?.presentError(retryAction: {
                    self?.getProducts(searchTerm: searchTerm)
                })
            }
        })
    }
}
