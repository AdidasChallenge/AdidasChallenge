//
//  Coordinator.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//

import UIKit

protocol Coordinator: AnyObject {
    var rootViewController: UIViewController? { get }
    
    func start()
}
