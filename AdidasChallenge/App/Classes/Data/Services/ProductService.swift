//
//  ProductService.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 05/05/2021.
//

import Foundation

final class ProductService: ProductWorker {
    
    private let productEntityMapper: ProductEntityMapper
    
    init(productEntityMapper: ProductEntityMapper) {
        self.productEntityMapper = productEntityMapper
    }
    
    func getProducts(searchTerm: String, completion: @escaping (Result<[Product], Error>) -> Void) {
        
        
        //filterProducts(searchTerm: searchTerm, products: <#T##[Product]#>)
        
        
    }
}

// MARK: - Search filter
private extension ProductService {
    func filterProducts(searchTerm: String, products: [Product]) -> [Product] {
        guard !searchTerm.isEmpty else { return products }
        
        return products.filter({
            guard searchTerm.contains($0.price) ||
                    searchTerm.contains($0.description) ||
                    searchTerm.contains($0.name) else {
                return false
            }
            
            return true
        })
    }
}
