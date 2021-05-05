//
//  ProductWorker.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 05/05/2021.
//

import Foundation

protocol ProductWorker: AnyObject {
    func getProducts(searchTerm: String, completion: @escaping (Result<[Product], Error>) -> Void)
}
