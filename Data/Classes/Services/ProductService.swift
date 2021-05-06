//
//  ProductService.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 05/05/2021.
//

import Foundation
import Alamofire
import Domain

final class ProductService: ProductWorker {
    private let productEntityMapper: ProductEntityMapper
    
    private let productsBaseApiUrl: String = "http://localhost:3001/product"
    
    // MARK: - Caching
    private var cache: [Product]?
    
    init(productEntityMapper: ProductEntityMapper) {
        self.productEntityMapper = productEntityMapper
    }
    
    func getProducts(searchTerm: String, completion: @escaping (Result<[Product], Error>) -> Void) {
        guard cache == nil || cache?.isEmpty ?? true else {
            
            guard let products = cache else { return }
            let filteredProducts = self.filterProducts(searchTerm: searchTerm, products: products)
            completion(.success(filteredProducts))
            return
        }
//        
//        cache = [
//            Product(id: "1", name: "Shoe", description: "Big shoe", currency: "$", price: "1", image: nil),
//            Product(id: "2", name: "Basketball", description: "Ball", currency: "$", price: "500", image: nil),
//            Product(id: "3", name: "Adidas Phone case", description: "phone case", currency: "$", price: "20", image: nil)
//        ]
//        
//        guard let products = self.cache else { return }
//        let filteredProducts = self.filterProducts(searchTerm: searchTerm, products: products)
//        completion(.success(filteredProducts))
//        
        AF.request(productsBaseApiUrl).responseJSON(completionHandler: { [weak self] response in
            
            switch response.result {
            case .success:
                guard let self = self, let data = response.data else { return }
                
                do {
                    let productEntities = try JSONDecoder().decode([ProductEntity].self, from: data)
                    self.cache = productEntities.compactMap({ self.productEntityMapper.map(entity:$0) })
                    guard let products = self.cache else { return }
                    let filteredProducts = self.filterProducts(searchTerm: searchTerm, products: products)
                    completion(.success(filteredProducts))
                    
                } catch {
                    print("Error: \(error)")
                }
                
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        })
    }
    
    func resetCache() {
        cache = nil
    }
}

// MARK: - Search filter
private extension ProductService {
    func filterProducts(searchTerm: String, products: [Product]) -> [Product] {
        let searchTerm = searchTerm.lowercased()
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
