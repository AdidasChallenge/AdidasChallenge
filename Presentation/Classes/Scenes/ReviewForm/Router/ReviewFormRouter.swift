//
//  ReviewFormRouter.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 04/05/2021.
//  
//

import Foundation

protocol ReviewFormRouterDelegate: AnyObject {
    func submitReviewForm()
    func dismissReviewForm()
}
