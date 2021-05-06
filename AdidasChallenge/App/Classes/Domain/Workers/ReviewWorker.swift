//
//  ReviewWorker.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 06/05/2021.
//

import Foundation

protocol ReviewWorker: AnyObject {
    func getReviewsFor(id: String, completion: @escaping (Result<[Review], Error>) -> Void)
    //func postReview(review: Review, completion: @escaping (Result<Void, Error>) -> Void)
}
