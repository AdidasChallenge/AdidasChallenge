//
//  HomeRouter.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//  
//

import Foundation
import Domain

protocol HomeRouterDelegate: AnyObject {
    func showDetail(product: Product)
}
