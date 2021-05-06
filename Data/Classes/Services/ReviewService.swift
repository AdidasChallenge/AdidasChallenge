//
//  ReviewService.swift
//  AdidasChallenge
//
//  Created by Jesse Klijn on 06/05/2021.
//

import Foundation
import Alamofire
import Domain

final class ReviewService: ReviewWorker {
    
    private let reviewEntityMapper: ReviewEntityMapper
    private let reviewsBaseApiUrl: String = "http://localhost:3002/reviews/"
    
    init(reviewEntityMapper: ReviewEntityMapper) {
        self.reviewEntityMapper = reviewEntityMapper
    }
    
    func getReviewsFor(id: String, completion: @escaping (Result<[Review], Error>) -> Void) {
        AF.request("\(reviewsBaseApiUrl)\(id)").responseJSON(completionHandler: { [weak self] response in
            switch response.result {
            case .success:
                guard let self = self, let data = response.data else { return }

                do {
                    let reviewEntities = try JSONDecoder().decode([ReviewEntity].self, from: data)
                    let reviews = reviewEntities.compactMap({ self.reviewEntityMapper.map(entity: $0) })
                    completion(.success(reviews))

                } catch {
                    completion(.failure(error))
                }

            case .failure(let error):
                completion(.failure(error))
            }
        })
    }
    
    func postReview(review: Review, completion: @escaping (Result<Void, Error>) -> Void) {
        let parameters: [String: Any] = [
            "productId": review.productId,
            "locale": review.locale,
            "rating": review.rating,
            "text": review.text
        ]
        
        AF.request("\(reviewsBaseApiUrl)\(review.productId)", method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON(completionHandler: { response in
                    switch response.result {
                    case .success:
                        completion(.success(()))
        
                    case .failure(let error):
                        completion(.failure(error))
                    }
                })
    }
}
